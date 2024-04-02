<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cda="urn:hl7-org:v3">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:variable name="state" select="'ct'"/>

	<xsl:variable name="condition1" select="//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[1]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code"/>

	<xsl:variable name="condition2" select="//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[2]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code"/>

	<xsl:variable name="condition3" select="//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[3]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code"/>

	<xsl:variable name="condition4" select="//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[4]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code"/>

	<xsl:variable name="condition5" select="//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[5]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code"/>

	<xsl:variable name="condition6" select="//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[6]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code"/>

	<xsl:variable name="condition7" select="//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[7]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code"/>


<xsl:template match="/">
	<RRxml>
		<documentInfo>
			<eCRNum value="{//cda:externalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.115']/cda:id/@root}"/>
			<setId value="{//cda:externalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.115']/cda:setId/@extension}"/>
			<versionNumber value="{//cda:externalDocument[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.115']/cda:versionNumber/@value}"/>
			<ecrReceiptTime value="{//cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.9']/cda:effectiveTime/@value}"/>
			<ecrReceiptTime2><xsl:value-of select="substring(//cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.9']/cda:effectiveTime/@value,0,9)"/></ecrReceiptTime2>
			
			<rrTime value="{/cda:ClinicalDocument/cda:effectiveTime/@value}"/>
			
			<rrTime2><xsl:value-of select="substring(/cda:ClinicalDocument/cda:effectiveTime/@value,0,9)"/></rrTime2>
			
			<encompassingEncounterDateLow>
				<xsl:value-of select="substring(//cda:encompassingEncounter/cda:effectiveTime/cda:low/@value,5,2)"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring(//cda:encompassingEncounter/cda:effectiveTime/cda:low/@value,7,2)"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring(//cda:encompassingEncounter/cda:effectiveTime/cda:low/@value,0,5)"/>
			</encompassingEncounterDateLow>
			
			<encompassingEncounterDateHigh>
				<xsl:value-of select="substring(//cda:encompassingEncounter/cda:effectiveTime/cda:high/@value,5,2)"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring(//cda:encompassingEncounter/cda:effectiveTime/cda:high/@value,7,2)"/>
				<xsl:text>/</xsl:text>
				<xsl:value-of select="substring(//cda:encompassingEncounter/cda:effectiveTime/cda:high/@value,0,5)"/>
			</encompassingEncounterDateHigh>
			
			<FirstName value="{/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name[@use='L']/cda:given}"/>
			<LastName value="{/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:name[@use='L']/cda:family}"/>
			<DOB value="{/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:patient/cda:birthTime/@value}"/>
			
			<encompassingEncounterCode value="{/cda:ClinicalDocument/cda:componentOf/cda:encompassingEncounter/cda:code/@code}"/>
			<manualInitiation value="{//cda:act[cda:templateId/@root= '2.16.840.1.113883.10.20.15.2.3.22']/cda:code/@code}"/>
			<receivedOrgName value="{/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:receivedOrganization/cda:name}"/>
			<receivedOrgState value="{/cda:ClinicalDocument/cda:informationRecipient/cda:intendedRecipient/cda:receivedOrganization/cda:addr/cda:state}"/>
			<providerOrgName value="{/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:name}"/>
			<providerOrgState value="{/cda:ClinicalDocument/cda:recordTarget/cda:patientRole/cda:providerOrganization/cda:addr/cda:state}"/>
			<serviceProviderOrgName value="{//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:name}"/>
			<serviceProviderOrgState value="{//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:addr/cda:state}"/>
			<healthCareFacilityName value="{//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location/cda:name}"/>  
			<healthCareFacilityState value="{//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location/cda:addr/cda:state}"/>
		</documentInfo>
		<conditionCode>
			<condition1state value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[1]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code}"/>
			
			<condition2state value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[2]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code}"/>
			<condition3state value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[3]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code}"/>
			<condition4state value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[4]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code}"/>
			<condition5state value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[5]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code}"/>
			<condition6state value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[6]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code}"/>
			<condition7state value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[7]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@code}"/>
			
			
			
			
			
			<displayName1 value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[1]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@displayName}"/>
			<displayName2 value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[2]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@displayName}"/>
			<displayName3 value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[3]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@displayName}"/>
			<displayName4 value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[4]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@displayName}"/>
			<displayName5 value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[5]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@displayName}"/>
			<displayName6 value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[6]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@displayName}"/>
			<displayName7 value="{//cda:organizer[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.34']/cda:component[7]/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.12'][cda:code/@code='64572001'][cda:entryRelationship/cda:organizer/cda:participant[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.4.3']/cda:participantRole/cda:id/@extension= $state][cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.15.2.3.19']/cda:value/@code='RRVS1']/cda:value/@displayName}"/>
		</conditionCode>
		<rules>
			<rulescondition1>
				<xsl:for-each select="//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.12'][cda:value/@code = $condition1]/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.19']/cda:entryRelationship">
					<xsl:value-of select="cda:observation/cda:value"/>
					<xsl:text>^</xsl:text>
				</xsl:for-each>
			</rulescondition1>
			<rulescondition2>
				<xsl:for-each select="//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.12'][cda:value/@code = $condition2]/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.19']/cda:entryRelationship">
					<xsl:value-of select="cda:observation/cda:value"/>
					<xsl:text>^</xsl:text>
				</xsl:for-each>
			</rulescondition2>
			<rulescondition3>
				<xsl:for-each select="//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.12'][cda:value/@code = $condition3]/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.19']/cda:entryRelationship">
					<xsl:value-of select="cda:observation/cda:value"/>
					<xsl:text>^</xsl:text>
				</xsl:for-each>
			</rulescondition3>
			<rulescondition4>
				<xsl:for-each select="//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.12'][cda:value/@code = $condition4]/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.19']/cda:entryRelationship">
					<xsl:value-of select="cda:observation/cda:value"/>
					<xsl:text>^</xsl:text>
				</xsl:for-each>
			</rulescondition4>
			<rulescondition5>
				<xsl:for-each select="//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.12'][cda:value/@code = $condition5]/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.19']/cda:entryRelationship">
					<xsl:value-of select="cda:observation/cda:value"/>
					<xsl:text>^</xsl:text>
				</xsl:for-each>
			</rulescondition5>
			<rulescondition6>
				<xsl:for-each select="//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.12'][cda:value/@code = $condition6]/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.19']/cda:entryRelationship">
					<xsl:value-of select="cda:observation/cda:value"/>
					<xsl:text>^</xsl:text>
				</xsl:for-each>
			</rulescondition6>
			<rulescondition7>
				<xsl:for-each select="//cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.12'][cda:value/@code = $condition7]/cda:entryRelationship/cda:organizer/cda:component/cda:observation[cda:templateId/@root = '2.16.840.1.113883.10.20.15.2.3.19']/cda:entryRelationship">
					<xsl:value-of select="cda:observation/cda:value"/>
					<xsl:text>^</xsl:text>
				</xsl:for-each>
			</rulescondition7>
		</rules>
	</RRxml>
</xsl:template>
</xsl:stylesheet>


