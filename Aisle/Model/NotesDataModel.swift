//
//  NotesDataModel.swift
//  Aisle
//
//  Created by Shivam Maurya on 07/11/24.
//


// MARK: - NotesDataModel
struct NotesDataModel: Codable {
    let invites: Invites?
    let likes: Likes?
}

// MARK: - Invites
struct Invites: Codable {
    let profiles: [Profile]
    let totalPages: Int?
    let pendingInvitationsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case profiles, totalPages
        case pendingInvitationsCount = "pending_invitations_count"
    }
}

// MARK: - Profile
struct Profile: Codable {
    let generalInformation: GeneralInformation
    let approvedTime: Double?
    let disapprovedTime: Double?
    let photos: [Photo]
    let userInterests: [String]?
    let work: Work
    let preferences: [Preference]
    let instagramImages: String?
    let lastSeenWindow: String?
    let isFacebookDataFetched: Bool
    let icebreakers: String?
    let story: String?
    let meetup: String?
    let verificationStatus: String?
    let hasActiveSubscription: Bool?
    let showConciergeBadge: Bool?
    let lat: Double?
    let lng: Double?
    let lastSeen: String?
    let onlineCode: Int?
    let profileDataList: [ProfileDataList]
    
    enum CodingKeys: String, CodingKey {
        case generalInformation = "general_information"
        case approvedTime = "approved_time"
        case disapprovedTime = "disapproved_time"
        case photos, userInterests, work, preferences, instagramImages, lastSeenWindow
        case isFacebookDataFetched = "is_facebook_data_fetched"
        case icebreakers, story, meetup, verificationStatus, hasActiveSubscription, showConciergeBadge
        case lat, lng, lastSeen, onlineCode
        case profileDataList = "profile_data_list"
    }
}

// MARK: - GeneralInformation
struct GeneralInformation: Codable {
    let dateOfBirth: String?
    let dateOfBirthV1: String?
    let location: Locotion
    let drinkingV1: DrinkingV1
    let firstName: String?
    let gender: String?
    let maritalStatusV1: MaritalStatusV1
    let refID: String?
    let smokingV1: SmokingV1
    let sunSignV1: SunSignV1
    let motherTongue: MotherTongue
    let faith: Faith
    let height: Int?
    let cast: String?
    let kid: String?
    let diet: String?
    let politics: String?
    let pet: String?
    let settle: String?
    let mbti: String?
    let age: Int?
    
    enum CodingKeys: String, CodingKey {
        case dateOfBirth = "date_of_birth"
        case dateOfBirthV1 = "date_of_birth_v1"
        case location, firstName, gender
        case drinkingV1 = "drinking_v1"
        case maritalStatusV1 = "marital_status_v1"
        case refID = "ref_id"
        case smokingV1 = "smoking_v1"
        case sunSignV1 = "sun_sign_v1"
        case motherTongue = "mother_tongue"
        case faith, height, cast, kid, diet, politics, pet, settle, mbti, age
    }
}

// MARK: - Location
struct Locotion: Codable {
    let summary: String?
    let full: String?
}

// MARK: - DrinkingV1
struct DrinkingV1: Codable {
    let id: Int?
    let name: String?
    let nameAlias: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case nameAlias = "name_alias"
    }
}

// MARK: - MaritalStatusV1
struct MaritalStatusV1: Codable {
    let id: Int?
    let name: String?
    let preferenceOnly: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case preferenceOnly = "preference_only"
    }
}

// MARK: - SmokingV1
struct SmokingV1: Codable {
    let id: Int?
    let name: String?
    let nameAlias: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case nameAlias = "name_alias"
    }
}

// MARK: - SunSignV1
struct SunSignV1: Codable {
    let id: Int?
    let name: String?
}

// MARK: - MotherTongue
struct MotherTongue: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Faith
struct Faith: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Photo
struct Photo: Codable {
    let photo: String?
    let photoID: Int?
    let selected: Bool?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case photo
        case photoID = "photo_id"
        case selected, status
    }
}

// MARK: - Work
struct Work: Codable {
    let industryV1: IndustryV1
    let monthlyIncomeV1: String?
    let experienceV1: ExperienceV1
    let highestQualificationV1: HighestQualificationV1
    let fieldOfStudyV1: FieldOfStudyV1
    
    enum CodingKeys: String, CodingKey {
        case industryV1 = "industry_v1"
        case monthlyIncomeV1 = "monthly_income_v1"
        case experienceV1 = "experience_v1"
        case highestQualificationV1 = "highest_qualification_v1"
        case fieldOfStudyV1 = "field_of_study_v1"
    }
}

// MARK: - IndustryV1
struct IndustryV1: Codable {
    let id: Int?
    let name: String?
    let preferenceOnly: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case preferenceOnly = "preference_only"
    }
}

// MARK: - ExperienceV1
struct ExperienceV1: Codable {
    let id: Int?
    let name: String?
    let nameAlias: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case nameAlias = "name_alias"
    }
}

// MARK: - HighestQualificationV1
struct HighestQualificationV1: Codable {
    let id: Int?
    let name: String?
    let preferenceOnly: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case preferenceOnly = "preference_only"
    }
}

// MARK: - FieldOfStudyV1
struct FieldOfStudyV1: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Preference
struct Preference: Codable {
    let answerID: Int?
    let id: Int?
    let value: Int?
    let preferenceQuestion: PreferenceQuestion
    
    enum CodingKeys: String, CodingKey {
        case answerID = "answer_id"
        case id, value
        case preferenceQuestion = "preference_question"
    }
}

// MARK: - PreferenceQuestion
struct PreferenceQuestion: Codable {
    let firstChoice: String?
    let secondChoice: String?
    
    enum CodingKeys: String, CodingKey {
        case firstChoice = "first_choice"
        case secondChoice = "second_choice"
    }
}

// MARK: - ProfileDataList
struct ProfileDataList: Codable {
    let question: String?
    let preferences: [PreferenceList]
    let invitationType: String?
    
    enum CodingKeys: String, CodingKey {
        case question, preferences
        case invitationType = "invitation_type"
    }
}

// MARK: - PreferenceList
struct PreferenceList: Codable {
    let answerID: Int?
    let answer: String?
    let firstChoice: String?
    let secondChoice: String?
    
    enum CodingKeys: String, CodingKey {
        case answerID = "answer_id"
        case answer
        case firstChoice = "first_choice"
        case secondChoice = "second_choice"
    }
}

// MARK: - Likes
struct Likes: Codable {
    let profiles: [LikesProfile]
    let canSeeProfile: Bool?
    let likesReceivedCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case profiles
        case canSeeProfile = "can_see_profile"
        case likesReceivedCount = "likes_received_count"
    }
}

// MARK: - LikesProfile
struct LikesProfile: Codable {
    let firstName: String?
    let avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case avatar
    }
}
