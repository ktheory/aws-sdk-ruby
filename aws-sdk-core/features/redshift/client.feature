# language: en
@redshift @client
Feature: Amazon Redshift

  Scenario: Making a basic request
    When I call the "DescribeClusterVersions" API
    Then the response should contain a list of "ClusterVersions"

  Scenario: Error handling
    When I attempt to call the "DescribeClusters" API with:
    | ClusterIdentifier | fake-cluster |
    Then I expect the response error code to be "ClusterNotFound"
    And I expect the response error message to include:
    """
    Cluster fake-cluster not found.
    """
