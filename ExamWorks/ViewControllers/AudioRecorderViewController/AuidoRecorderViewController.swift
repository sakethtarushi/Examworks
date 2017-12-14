//
//  AuidoRecorderViewController.swift
//  ExamWorks
//
//  Created by Saketh Ashvapuram on 07/12/17.
//  Copyright © 2017 Saketh Ashvapuram. All rights reserved.
//

import UIKit
import AVFoundation

class AuidoRecorderViewController: BaseViewController, AVAudioRecorderDelegate,AVAudioPlayerDelegate {
    
    
    var recordButton: UIButton!
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    var playButton:UIButton!
    var engine:AVAudioEngine!
    var chunkFile: AVAudioFile! = nil
    var outputFramesPerSecond: Float64 = 0  // aka input sample rate
    var chunkFrames: AVAudioFrameCount = 0
    var chunkFileNumber: Int = 0
    var chunkSentIndex: Int = 0
    
    struct K {
        static let secondsPerChunk: Float64 = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let label_title = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 32))
        label_title.textAlignment = NSTextAlignment.center
        label_title.textColor = UIColor.white
        label_title.text = "Record"
        self.navigationItem.titleView = label_title
        
        
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        // failed to record!
                        print("Failed to record")
                    }
                }
            }
        } catch {
            // failed to record!
            print("Got exxception")
        }

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: Recording methods
    
    func loadRecordingUI() {
        recordButton = UIButton(frame: CGRect(x: 64, y: 100, width: 128, height: 32))
        recordButton.layer.cornerRadius = 5.0
        recordButton.setTitle("Tap to Record", for: .normal)
        recordButton.backgroundColor = Constants.Constants.COLOR_APPTHEME
        recordButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        view.addSubview(recordButton)
        
        playButton = UIButton(frame: CGRect(x: self.view.frame.size.width-128-64, y: 100, width: 128, height: 32))
        playButton.layer.cornerRadius = 5.0
        playButton.setTitle("Send a Chunk", for: .normal)
        playButton.backgroundColor = Constants.Constants.COLOR_APPTHEME
        playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.0)
        playButton.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
        view.addSubview(playButton)
        
    }
    
    func writeBuffer(_ buffer: AVAudioPCMBuffer) {
        let samplesPerSecond = buffer.format.sampleRate
        
        if chunkFile == nil {
            createNewChunkFile(numChannels: buffer.format.channelCount, samplesPerSecond: samplesPerSecond)
        }
        
        try! chunkFile.write(from: buffer)
        chunkFrames += buffer.frameLength
        
        if chunkFrames > AVAudioFrameCount(K.secondsPerChunk * samplesPerSecond) {
            chunkFile = nil // close file
        }
    }
    
    func createNewChunkFile(numChannels: AVAudioChannelCount, samplesPerSecond: Float64) {
        let fileUrl = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("chunk-\(chunkFileNumber).aac")!
        print("writing chunk to \(fileUrl)")
        
        let settings: [String: Any] = [
            AVFormatIDKey: kAudioFormatMPEG4AAC,
            AVEncoderBitRateKey: 64000,
            AVNumberOfChannelsKey: numChannels,
            AVSampleRateKey: samplesPerSecond
        ]
        
        chunkFile = try! AVAudioFile(forWriting: fileUrl, settings: settings)
        
        chunkFileNumber += 1
        chunkFrames = 0
    }
    
//    func playchunkfile(numChannels: AVAudioChannelCount, samplesPerSecond: Float64){
//
//        let fileUrl = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("chunk-\(chunkFileNumber).aac")!
//
//    //    let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
//
//        let url = fileUrl
//
//        do {
//
//           // playButton.setTitle("Tap to Stop", for: .normal)
//
//        } catch {
//            // couldn't load file :(
//        }
//
//
//    }
//
    // MARK: Recording methods
    
    func startRecording() {
        
        recordButton.setTitle("Tap to Stop", for: .normal)

        engine = AVAudioEngine()
        let input = engine.inputNode
        let bus = 0
        let inputFormat = input.inputFormat(forBus: bus)
        
        input.installTap(onBus: bus, bufferSize: 512, format: inputFormat) { (buffer, time) -> Void in
            DispatchQueue.main.async {
                self.writeBuffer(buffer)
            }
        }
        
        try! engine.start()
        
        
        return
        
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }

  
    func finishRecording(success: Bool) {

        engine.stop()
        engine = nil

        if success {
            recordButton.setTitle("Tap to Record", for: .normal)
            
            print("Recording ended successfully")
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
    }
    
    @objc func recordTapped() {
        
        if engine == nil {
            startRecording()

        } else {
            finishRecording(success: true)
        }
    }
    
    // MARK: Play methods
    
    @objc func playTapped() {
        
        self.removeChunk()
        
        chunkSentIndex += 1

        
        if audioPlayer == nil {
          //  startPlaying()
        } else {
          //  finishPlayer(success: true)
        }
        
       
    }
    
    func removeChunk() {
        let fileUrl = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("chunk-\(chunkSentIndex).aac")!
        let fileManager = FileManager.default
        do {
              try  fileManager.removeItem(at: fileUrl)
        } catch {
            print("Could not clear temp folder: \(error)")
        }

    }
    
    func startPlaying() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        let url = audioFilename
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.delegate = self
            audioPlayer?.play()
            
            playButton.setTitle("Tap to Stop", for: .normal)

        } catch {
            // couldn't load file :(
        }
    }
    
    func finishPlayer(success: Bool) {
        audioPlayer.stop()
        audioPlayer = nil
        
        if success {
            playButton.setTitle("Tap to Play", for: .normal)
        } else {
            playButton.setTitle("Tap to Play", for: .normal)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        
        print("File path for recording is \(documentsDirectory)")
        
        return documentsDirectory
    }
    // MARK: Audio recorder delegate methods
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    //MARK: Audio player delegate methods
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
       finishPlayer(success: flag)
    }
    
    
    // MARK: Viewcontroller life cycle events
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.navigationController?.navigationBar.isTranslucent = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
