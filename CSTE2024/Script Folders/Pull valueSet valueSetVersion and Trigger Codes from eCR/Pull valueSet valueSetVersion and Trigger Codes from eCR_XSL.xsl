<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/">
		<data>
			
			<xsl:variable name="ecrnum" select="/cda:ClinicalDocument/cda:id/@root"/>
			<xsl:variable name="setid" select="/cda:ClinicalDocument/cda:setId/@extension"/>
			<xsl:variable name="version" select="/cda:ClinicalDocument/cda:versionNumber/@value"/>
			
			<xsl:variable name="ecrDateY" select="substring(/cda:ClinicalDocument/cda:effectiveTime/@value,0,5)"/>
			<xsl:variable name="ecrDateM" select="substring(/cda:ClinicalDocument/cda:effectiveTime/@value,5,2)"/>
			<xsl:variable name="ecrDateD" select="substring(/cda:ClinicalDocument/cda:effectiveTime/@value,7,2)"/>
			
			<xsl:variable name="encounterDateY" select="substring(//cda:encompassingEncounter/cda:effectiveTime/cda:low/@value,0,5)"/>
			<xsl:variable name="encounterDateM" select="substring(//cda:encompassingEncounter/cda:effectiveTime/cda:low/@value,5,2)"/>
			<xsl:variable name="encounterDateD" select="substring(//cda:encompassingEncounter/cda:effectiveTime/cda:low/@value,7,2)"/>
			
			<xsl:variable name="encounterCode" select="//cda:encompassingEncounter/cda:code/@code"/>
			
			<xsl:variable name="initiationTypeCode" select="/cda:ClinicalDocument/cda:documentationOf/cda:serviceEvent/cda:code/@code"/>
			
			<xsl:variable name="custodianName" select="//cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:name"/>
			<xsl:variable name="custodianIdExt" select="//cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:id/@extension"/>
			<xsl:variable name="custodianIdRoot" select="//cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:id/@root"/>
			<xsl:variable name="custodianStreet" select="//cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:addr/cda:streetAddressLine"/>
			<xsl:variable name="custodianCity" select="//cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:addr/cda:city"/>
			<xsl:variable name="custodianState" select="//cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:addr/cda:state"/>
			<xsl:variable name="custodianPostalCode" select="//cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization/cda:addr/cda:postalCode"/>
			
			<xsl:variable name="serviceProviderOrgName" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:name"/>
			<xsl:variable name="serviceProviderOrgIdExt" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:id/@extension"/>
			<xsl:variable name="serviceProviderOrgIdRoot" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:id/@root"/>
			<xsl:variable name="serviceProviderOrgStreet" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:addr/cda:streetAddressLine"/>
			<xsl:variable name="serviceProviderOrgCity" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:addr/cda:city"/>
			<xsl:variable name="serviceProviderOrgState" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:addr/cda:state"/>
			<xsl:variable name="serviceProviderOrgZip" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:serviceProviderOrganization/cda:addr/cda:postalCode"/>
			
			<xsl:variable name="healthCareFacilityName" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location/cda:name"/>
			<xsl:variable name="healthCareFacilityIdExt" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:id/@extension"/>
			<xsl:variable name="healthCareFacilityIdRoot" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:id/@root"/>
			<xsl:variable name="healthCareFacilityStreet" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location/cda:addr/cda:streetAddressLine"/>
			<xsl:variable name="healthCareFacilityCity" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location/cda:addr/cda:city"/>
			<xsl:variable name="healthCareFacilityState" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location/cda:addr/cda:state"/>
			<xsl:variable name="healthCareFacilityPostalCode" select="//cda:encompassingEncounter/cda:location/cda:healthCareFacility/cda:location/cda:addr/cda:postalCode"/>
			
			
			
				<xsl:choose>
					<xsl:when test="//cda:*[@sdtc:valueSet]">
						<xsl:for-each select="//cda:*[@sdtc:valueSet]">
							<record>
								<ecrnumber>
									<xsl:value-of select="$ecrnum"/>
									<xsl:text>^</xsl:text>
								</ecrnumber>
								
								<ecrnumbersubstring>
									<xsl:value-of select="substring($ecrnum,0,24)"/>
									<xsl:text>^</xsl:text>
								</ecrnumbersubstring>
								
								<ecrsetid>
									<xsl:value-of select="$setid"/>
									<xsl:text>^</xsl:text>
								</ecrsetid>
								
								<version>
									<xsl:value-of select="$version"/>
									<xsl:text>^</xsl:text>
								</version>
								
								<ecrDate>
									<xsl:value-of select="$ecrDateM"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="$ecrDateD"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="$ecrDateY"/>
								</ecrDate>
								
								<encounterDate>
									<xsl:value-of select="$encounterDateM"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="$encounterDateD"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="$encounterDateY"/>
								</encounterDate>
								
								<encounterCode>
									<xsl:value-of select="$encounterCode"/>
									<xsl:text>^</xsl:text>
								</encounterCode>
								
								<initiationTypeCode>
									<xsl:value-of select="$initiationTypeCode"/>
									<xsl:text>^</xsl:text>
								</initiationTypeCode>
								
								<custodianName>
									<xsl:value-of select="$custodianName"/>
									<xsl:text>^</xsl:text>
								</custodianName>
								
								<custodianIdExt>
									<xsl:value-of select="$custodianIdExt"/>
									<xsl:text>^</xsl:text>
								</custodianIdExt>
								
								<custodianIdRoot>
									<xsl:value-of select="$custodianIdRoot"/>
									<xsl:text>^</xsl:text>
								</custodianIdRoot>
								
								<custodianStreet>
									<xsl:value-of select="$custodianStreet"/>
									<xsl:text>^</xsl:text>
								</custodianStreet>
								
								<custodianCity>
									<xsl:value-of select="$custodianCity"/>
									<xsl:text>^</xsl:text>
								</custodianCity>
								
								<custodianState>
									<xsl:value-of select="$custodianState"/>
									<xsl:text>^</xsl:text>
								</custodianState>
								
								<custodianPostalCode>
									<xsl:value-of select="$custodianPostalCode"/>
									<xsl:text>^</xsl:text>
								</custodianPostalCode>
								
								<serviceProviderName>
									<xsl:value-of select="$serviceProviderOrgName"/>
									<xsl:text>^</xsl:text>
								</serviceProviderName>
								
								<serviceProviderIdExt>
									<xsl:value-of select="$serviceProviderOrgIdExt"/>
									<xsl:text>^</xsl:text>
								</serviceProviderIdExt>
								
								<serviceProviderIdRoot>
									<xsl:value-of select="$serviceProviderOrgIdRoot"/>
									<xsl:text>^</xsl:text>
								</serviceProviderIdRoot>
								
								<serviceProviderStreet>
									<xsl:value-of select="$serviceProviderOrgStreet"/>
									<xsl:text>^</xsl:text>
								</serviceProviderStreet>
								
								<serviceProviderCity>
									<xsl:value-of select="$serviceProviderOrgCity"/>
									<xsl:text>^</xsl:text>
								</serviceProviderCity>
								
								<serviceProviderState>
									<xsl:value-of select="$serviceProviderOrgState"/>
									<xsl:text>^</xsl:text>
								</serviceProviderState>
								
								<serviceProviderPostalCode>
									<xsl:value-of select="$serviceProviderOrgZip"/>
									<xsl:text>^</xsl:text>
								</serviceProviderPostalCode>
								
								<healthCareFacilityName>
									<xsl:value-of select="$healthCareFacilityName"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityName>
								
								<healthCareFacilityIdExt>
									<xsl:value-of select="$healthCareFacilityIdExt"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityIdExt>
								
								<healthCareFacilityIdRoot>
									<xsl:value-of select="$healthCareFacilityIdRoot"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityIdRoot>
								
								<healthCareFacilityStreet>
									<xsl:value-of select="$healthCareFacilityStreet"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityStreet>
								
								<healthCareFacilityCity>
									<xsl:value-of select="$healthCareFacilityCity"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityCity>
								
								<healthCareFacilityState>
									<xsl:value-of select="$healthCareFacilityState"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityState>
								
								<healthCareFacilityPostalCode>
									<xsl:value-of select="$healthCareFacilityPostalCode"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityPostalCode>
								
								<code>
									<xsl:value-of select="@code"/>
									<xsl:text>^</xsl:text>
								</code>
								
								<value>
									<xsl:value-of select="@value"/>
									<xsl:text>^</xsl:text>
								</value>
								
								<codeSystem>
									<xsl:value-of select="@codeSystem"/>
									<xsl:text>^</xsl:text>
								</codeSystem>
								
								<codeSystemName>
									<xsl:value-of select="@codeSystemName"/>
									<xsl:text>^</xsl:text>
								</codeSystemName>
								
								<valueSet>
									<xsl:value-of select="@sdtc:valueSet"/>
									<xsl:text>^</xsl:text>
								</valueSet>
								
								<valueSetVersion>
									<xsl:value-of select="@sdtc:valueSetVersion"/>
									<xsl:text>^</xsl:text>
								</valueSetVersion>
							</record>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<record>
								<ecrnumber>
									<xsl:value-of select="$ecrnum"/>
									<xsl:text>^</xsl:text>
								</ecrnumber>
								
								<ecrnumbersubstring>
									<xsl:value-of select="substring($ecrnum,0,24)"/>
									<xsl:text>^</xsl:text>
								</ecrnumbersubstring>
								
								<ecrsetid>
									<xsl:value-of select="$setid"/>
									<xsl:text>^</xsl:text>
								</ecrsetid>
								
								<version>
									<xsl:value-of select="$version"/>
									<xsl:text>^</xsl:text>
								</version>
								
								<ecrDate>
									<xsl:value-of select="$ecrDateM"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="$ecrDateD"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="$ecrDateY"/>
								</ecrDate>
								
								<encounterDate>
									<xsl:value-of select="$encounterDateM"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="$encounterDateD"/>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="$encounterDateY"/>
								</encounterDate>
								
								<encounterCode>
									<xsl:value-of select="$encounterCode"/>
									<xsl:text>^</xsl:text>
								</encounterCode>
								
								<initiationTypeCode>
									<xsl:value-of select="$initiationTypeCode"/>
									<xsl:text>^</xsl:text>
								</initiationTypeCode>
								
								<custodianName>
									<xsl:value-of select="$custodianName"/>
									<xsl:text>^</xsl:text>
								</custodianName>
								
								<custodianIdExt>
									<xsl:value-of select="$custodianIdExt"/>
									<xsl:text>^</xsl:text>
								</custodianIdExt>
								
								<custodianIdRoot>
									<xsl:value-of select="$custodianIdRoot"/>
									<xsl:text>^</xsl:text>
								</custodianIdRoot>
								
								<custodianStreet>
									<xsl:value-of select="$custodianStreet"/>
									<xsl:text>^</xsl:text>
								</custodianStreet>
								
								<custodianCity>
									<xsl:value-of select="$custodianCity"/>
									<xsl:text>^</xsl:text>
								</custodianCity>
								
								<custodianState>
									<xsl:value-of select="$custodianState"/>
									<xsl:text>^</xsl:text>
								</custodianState>
								
								<custodianPostalCode>
									<xsl:value-of select="$custodianPostalCode"/>
									<xsl:text>^</xsl:text>
								</custodianPostalCode>
								
								<serviceProviderName>
									<xsl:value-of select="$serviceProviderOrgName"/>
									<xsl:text>^</xsl:text>
								</serviceProviderName>
								
								<serviceProviderIdExt>
									<xsl:value-of select="$serviceProviderOrgIdExt"/>
									<xsl:text>^</xsl:text>
								</serviceProviderIdExt>
								
								<serviceProviderIdRoot>
									<xsl:value-of select="$serviceProviderOrgIdRoot"/>
									<xsl:text>^</xsl:text>
								</serviceProviderIdRoot>
								
								<serviceProviderStreet>
									<xsl:value-of select="$serviceProviderOrgStreet"/>
									<xsl:text>^</xsl:text>
								</serviceProviderStreet>
								
								<serviceProviderCity>
									<xsl:value-of select="$serviceProviderOrgCity"/>
									<xsl:text>^</xsl:text>
								</serviceProviderCity>
								
								<serviceProviderState>
									<xsl:value-of select="$serviceProviderOrgState"/>
									<xsl:text>^</xsl:text>
								</serviceProviderState>
								
								<serviceProviderPostalCode>
									<xsl:value-of select="$serviceProviderOrgZip"/>
									<xsl:text>^</xsl:text>
								</serviceProviderPostalCode>
								
								<healthCareFacilityName>
									<xsl:value-of select="$healthCareFacilityName"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityName>
								
								<healthCareFacilityIdExt>
									<xsl:value-of select="$healthCareFacilityIdExt"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityIdExt>
								
								<healthCareFacilityIdRoot>
									<xsl:value-of select="$healthCareFacilityIdRoot"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityIdRoot>
								
								<healthCareFacilityStreet>
									<xsl:value-of select="$healthCareFacilityStreet"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityStreet>
								
								<healthCareFacilityCity>
									<xsl:value-of select="$healthCareFacilityCity"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityCity>
								
								<healthCareFacilityState>
									<xsl:value-of select="$healthCareFacilityState"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityState>
								
								<healthCareFacilityPostalCode>
									<xsl:value-of select="$healthCareFacilityPostalCode"/>
									<xsl:text>^</xsl:text>
								</healthCareFacilityPostalCode>
								
								<code>
									<xsl:text>No Trigger Code Specified</xsl:text>
								</code>
								
								<value>
									<xsl:text>No Trigger Code Specified</xsl:text>
								</value>
								
								<codeSystem>
									<xsl:text>No Trigger Code Specified</xsl:text>
								</codeSystem>
								
								<codeSystemName>
									<xsl:text>No Trigger Code Specified</xsl:text>
								</codeSystemName>
								
								<valueSet>
									<xsl:text>No Trigger Code Specified</xsl:text>
								</valueSet>
								
								<valueSetVersion>
									<xsl:text>No Trigger Code Specified</xsl:text>
								</valueSetVersion>
							</record>
					</xsl:otherwise>
				</xsl:choose>
		</data>
	</xsl:template>
</xsl:stylesheet>