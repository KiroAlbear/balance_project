class Urls {
  Urls._();

  static const String demoUrl = "";
  static const String testUrl = "http://192.168.1.109:8082";
  static const String devUrl = "http://api.td-dev.turndigital.net:7070";

  static String baseUrl = devUrl;

  static String appLanguage = "ar-eg";

  static const String getLocalizationStrings = "";

  static const testConnectionUrl = "www.youtube.com";

  static String get getHeader {
    return '$baseUrl/api/admin/home/header/getActiveHeaderSectionContent';
  }

  static String get updateHeader {
    return '$baseUrl/api/admin/home/header/updateHeaderContentData';
  }

  static String get addHeader {
    return '$baseUrl/api/admin/home/header/addHeaderContentData';
  }

  static String get addClientItem {
    return '$baseUrl/api/admin/home/clients/addClient';
  }

  static String get addClientDomain {
    return '$baseUrl/api/admin/home/clients/addClientDomain';
  }

  static String updateClientItem(int id) {
    return '$baseUrl/api/admin/home/clients/updateClientItem/$id';
  }

  static String deleteClientItem(int id) {
    return '$baseUrl/api/admin/home/clients/deleteClientItem/$id';
  }

  static String updateClientDomain(int id) {
    return '$baseUrl/api/admin/home/clients/updateClientDomain/$id';
  }

  static String deleteClientDomain(int id) {
    return '$baseUrl/api/admin/home/clients/deleteClientDomain/$id';
  }

  static String get addClientsSection {
    return '$baseUrl/api/admin/home/clients/addClientContentData';
  }

  static String get updateClientsSection {
    return '$baseUrl/api/admin/home/clients/updateClientContentData';
  }

  static String get getClientsSection {
    return '$baseUrl/api/admin/home/clients/getActiveClientsSectionContent';
  }

  static String get getClients {
    return '$baseUrl/api/admin/home/clients/getClientsList';
  }

  static String get getClientDomains {
    return '$baseUrl/api/admin/home/clients/getClientsDomains';
  }

  static String get addServiceSection {
    return '$baseUrl/api/admin/home/services/addServiceContentData';
  }

  static String get updateServiceSection {
    return '$baseUrl/api/admin/home/services/updateServiceContentData';
  }

  static String get getServiceSection {
    return '$baseUrl/api/admin/home/services/getActiveServiceSectionContent';
  }

  static String get getServiceList {
    return '$baseUrl/api/admin/home/services/getServicesItemsContent';
  }

  static String get addServiceItemList {
    return '$baseUrl/api/admin/home/services/addNewServiceItem';
  }

  static String updateServiceItemList(int id) {
    return '$baseUrl/api/admin/home/services/updateServiceItem/$id';
  }

  static String deleteServiceListItem(int id) {
    return '$baseUrl/api/admin/home/services/deleteServiceItem/$id';
  }

  static String get getOther {
    return '$baseUrl/api/admin/home/others/getActiveOtherSectionContent';
  }

  static String get updateOther {
    return '$baseUrl/api/admin/home/others/updateOtherSectionContentData';
  }

  static String get addOther {
    return '$baseUrl/api/admin/home/others/addOtherSectionContentData';
  }

  //////// technology
  static String get getTechnology {
    return '$baseUrl/api/admin/home/technology/getActiveTechnologySectionContent';
  }

  static String get updateTechnology {
    /// TODO: Need tp change
    return '$baseUrl/api/admin/home/technology/updateTechnologyContentData';
  }

  static String get addTechnology {
    return '$baseUrl/api/admin/home/technology/addTechnologyContentData';
  }

  static String get getTechnologyList {
    return '$baseUrl/api/admin/home/technology/getTechnologyItemsContent';
  }

  static String get addTechnologyListItem {
    return '$baseUrl/api/admin/home/technology/addTechItem';
  }

  static String updateTechnologyListItem(int id) {
    return '$baseUrl/api/admin/home/technology/updateTechnologyItem/$id';
  }

  static String deleteTechnologyListItem(int id) {
    return '$baseUrl/api/admin/home/technology/deleteTechnologyItem/$id';
  }

  /////////////////////////////////////////////////////////////

  static String get getEngagement {
    return '$baseUrl/api/admin/home/engagement/getActiveEngagementSectionContent';
  }

  static String get updateEngagement {
    /// TODO: Need tp change
    return '$baseUrl/api/admin/home/engagement/updateEngagementContentData';
  }

  static String get addEngagement {
    return '$baseUrl/api/admin/home/engagement/addEngagementContentData';
  }

  static String get getEngagementList {
    return '$baseUrl/api/admin/home/engagement/getEngagementItemsContent';
  }

  static String deleteEngagementListItem(int id) {
    return '$baseUrl/api/admin/home/engagement/deleteEngagementItem/$id';
  }

  static String updateEngagementListItem(int id) {
    return '$baseUrl/api/admin/home/engagement/updateEngagementItem/$id';
  }

  static String get addEngagementListItem {
    return '$baseUrl/api/admin/home/engagement/addEngagementItem';
  }

  static String get getDivider {
    return '$baseUrl/api/admin/home/divider/getActiveDividerSectionContent';
  }

  static String get updateDivider {
    /// TODO: Need tp change
    return '$baseUrl/api/admin/home/divider/updateDividerContentData';
  }

  static String get addDivider {
    return '$baseUrl/api/admin/home/divider/addDividerContentData';
  }

  //////// Offerings
  static String get getOfferingsSection {
    return '$baseUrl/api/admin/home/offerings/getActiveOfferingsSectionContent';
  }

  static String get addOfferingsSection {
    return '$baseUrl/api/admin/home/offerings/addOfferingContentData';
  }

  static String get getOfferingsList {
    return '$baseUrl/api/admin/home/offerings/getOfferingsItemsContent';
  }

  static String deleteOfferingsListItem(int id) {
    return '$baseUrl/api/admin/home/offerings/deleteOfferingItem/$id';
  }

  static String updateOfferingsListItem(int id) {
    return '$baseUrl/api/admin/home/offerings/updateOfferingsItem/$id';
  }

  static String get addOfferingsListItem {
    return '$baseUrl/api/admin/home/offerings/addOfferingsItem';
  }

  static String get updateOfferings {
    return '$baseUrl/api/admin/home/offerings/updateOfferingContentData';
  }

  /////////////////////////////////////////////////////////////
}
