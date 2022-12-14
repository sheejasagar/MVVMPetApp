//
//  PetsViewController.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/13/22.
//

import UIKit

class PetsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Costants
    private let screenTitle = "Pets"
    private let storyBoard = "Main"
    private let viewIdentifier = "PetDetailViewControllerId"
    private let alertTitle = "Info"
    private let alertMessage = "This feature is available during office hours. Please try between 9 AM - 6 PM."
    private let okButtonTitle = "OK"
    
    // MARK: - Declarations
    private var petsViewModel : PetsViewModel!
    private var dataSource : PetTableViewDataSource<PetTableViewCell,PetData>!
    private var delegate : PetsTableViewDelegate<PetData>!
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initViewModel()
    }
    
    // MARK: - Custom Methods
    func initView() {
        self.title = screenTitle
        
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = true
        
        tableView.register(PetTableViewCell.nib, forCellReuseIdentifier: PetTableViewCell.identifier)
    }
    
    func initViewModel(){
        self.petsViewModel =  PetsViewModel()
        self.petsViewModel.loadPetList = {
            self.updateDelegate()
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        self.dataSource = PetTableViewDataSource(cellIdentifier: PetTableViewCell.identifier, items: self.petsViewModel.petData.pets, configureCell: { (cell, pet) in
            cell.pet = pet
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
    
    func updateDelegate() {
        self.delegate = PetsTableViewDelegate(items: self.petsViewModel.petData.pets, didSelectRowAt: { (pet) in
            if self.petsViewModel.isValidateWorkHours() {
                self.loadPetDetailView(pet)
            }else {
                self.displayAlert()
            }
        })
        
        DispatchQueue.main.async {
            self.tableView.delegate = self.delegate
            self.tableView.reloadData()
        }
    }
    
    func loadPetDetailView(_ pet: PetData) {
        let storyboard = UIStoryboard(name: self.storyBoard, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: self.viewIdentifier) as? PetDetailViewController {
            vc.pet = pet
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func displayAlert() {
        let dialogMessage = UIAlertController(title: alertTitle,
                                              message: alertMessage,
                                              preferredStyle: .alert)
        let ok = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
