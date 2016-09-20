//
//  DatasourceConfig.swift
//  Asdfasdfdffsgdgs
//
//  This App has been generated using IBM Mobile App Builder
//

import Foundation
 
 enum DatasourceConfig {

	
	enum Local {

		enum EmptyDatasource{
			
			static let resource = "EmptyDatasource"
		}
	}
	 
	
	enum Cloud {
		
		static let baseUrl = "https://baked-devel-ibm.herokuapp.com"

		enum Screen0DS{
			
			static let resource = "/app/575eb5028c0cdf030054865f/r/screen0DS"
			static let apiKey = "nROOhy71"
		}

		enum RestaurantsDS{
			
			static let resource = "/app/575eb5028c0cdf030054865f/r/restaurantsDS"
			static let apiKey = "nROOhy71"
		}

		enum LawyersScreen1DS{
			
			static let resource = "/app/575eb5028c0cdf030054865f/r/lawyersScreen1DS"
			static let apiKey = "nROOhy71"
		}

		enum GymsScreen1DS{
			
			static let resource = "/app/575eb5028c0cdf030054865f/r/gymsScreen1DS"
			static let apiKey = "nROOhy71"
		}

		enum TestDS{
			
			static let resource = "/app/575eb5028c0cdf030054865f/r/testDS"
			static let apiKey = "nROOhy71"
		}

		enum AaaaaaaDS{
			
			static let resource = "/app/575eb5028c0cdf030054865f/r/aaaaaaaDS"
			static let apiKey = "nROOhy71"
		}
	}


	
	enum Cloudant {

		enum EdtestDS{
			
			static let url = "http://9a7753f7-a2f8-4e4f-8501-45326f1c8783-bluemix:e413b1400c11d28e2888d8ba9bf94c23461296fc77241eedb8f9e11341cc473c@9a7753f7-a2f8-4e4f-8501-45326f1c8783-bluemix.cloudant.com/cloudant"
			static let datastoreName = "cloudant"
			static let indexes:[String] = [] // TODO: not implemented yet
		}
	}
}
