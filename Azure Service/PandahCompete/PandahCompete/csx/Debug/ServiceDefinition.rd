<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="PandahCompete" generation="1" functional="0" release="0" Id="de1f5199-7cfa-4447-ba0b-f6e7707f9ea4" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="PandahCompeteGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="PandahCompeteWebRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/PandahCompete/PandahCompeteGroup/LB:PandahCompeteWebRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="PandahCompeteWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/PandahCompete/PandahCompeteGroup/MapPandahCompeteWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="PandahCompeteWebRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/PandahCompete/PandahCompeteGroup/MapPandahCompeteWebRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:PandahCompeteWebRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/PandahCompete/PandahCompeteGroup/PandahCompeteWebRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapPandahCompeteWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/PandahCompete/PandahCompeteGroup/PandahCompeteWebRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapPandahCompeteWebRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/PandahCompete/PandahCompeteGroup/PandahCompeteWebRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="PandahCompeteWebRole" generation="1" functional="0" release="0" software="C:\Users\Kevin\documents\visual studio 2015\Projects\PandahCompete\PandahCompete\csx\Debug\roles\PandahCompeteWebRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;PandahCompeteWebRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;PandahCompeteWebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/PandahCompete/PandahCompeteGroup/PandahCompeteWebRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/PandahCompete/PandahCompeteGroup/PandahCompeteWebRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/PandahCompete/PandahCompeteGroup/PandahCompeteWebRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="PandahCompeteWebRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="PandahCompeteWebRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="PandahCompeteWebRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="cafed397-98c8-4424-9bd9-c655c781951e" ref="Microsoft.RedDog.Contract\ServiceContract\PandahCompeteContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="33476e9d-5f5c-490c-84b0-6eb0266a4970" ref="Microsoft.RedDog.Contract\Interface\PandahCompeteWebRole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/PandahCompete/PandahCompeteGroup/PandahCompeteWebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>