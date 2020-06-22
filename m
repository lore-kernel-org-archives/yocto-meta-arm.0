Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.45])
 by mx.groups.io with SMTP id smtpd.web11.18503.1592835519279193506
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Jun 2020 07:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0vb07hb2;
 spf=pass (domain: arm.com, ip: 40.107.13.45, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbrxQaQ9XQFypN2Oj9GBu6/I0u+XqheclA4qYecSDgU=;
 b=0vb07hb23wW0NP21axNArjJuWN2XxELC4eCJblbv/Jsp6nQMYVngl6DJr0RGxkwTrsDV1YuFrbuQHYg3owvwkp5zQbu6ZGbhbXQlPL91RToV0GmFhzeHwgmYClkX9r8aE2MVTAVqkA9Eut3ykTPrBXWYJRhJcz9zMYqEV70uqmo=
Received: from DB8PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:10:100::28)
 by DB7PR08MB3418.eurprd08.prod.outlook.com (2603:10a6:10:27::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 14:18:36 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::c5) by DB8PR06CA0015.outlook.office365.com
 (2603:10a6:10:100::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 14:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 14:18:36 +0000
Received: ("Tessian outbound 147ff5d152c1:v59"); Mon, 22 Jun 2020 14:18:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dac3a3b00bf74798
X-CR-MTA-TID: 64aa7808
Received: from 3ae942b01845.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AC94DFD4-1E06-4519-981E-85B5A0245FDB.1;
	Mon, 22 Jun 2020 14:18:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ae942b01845.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jun 2020 14:18:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+VUfbJ/PL3E/NCU1go/ZJzZMFB007nCxyr+57ZPTCfk+gaBI0C+rzQpbftOctDWQBHq+0f63hII7I7+v8syP0TAL4dC5iTMYrNx2YSb+E135IsYu4+wCR77EFf8o+AFuy7jGcr6Vlh335ov0g7ixmSgGvwaFrvergSLDdMo5pAy8ManEqXD9mXj1m/9DueH1jmKV9KzDaGTfEV9zI7sE8CUp5LL/CaEl8vUlg6P3R1CxAVyY8N6XOR6lT/5xv87YZZWGyk+S27gH5bjLP8tNmrS6Ppp5V8+Ow1In+UnuHwrzrVIx1Zaeo+IJS2vQLNESALmg5D6Z4hjiuCeTKAGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbrxQaQ9XQFypN2Oj9GBu6/I0u+XqheclA4qYecSDgU=;
 b=ArmpbNrwkM1hFH8hCwT+mloE2Fvq0Kb2+NXkgjBbC2vHD2GxTb3G47ObOJHAfVJHFIgIc9I7rwcEOCX5Wrk5Y1w1tv520noYuJVkZXIcE7t1UwKDJXUkbF3D3Av0la8A+BvfY4L67TiN4JQH1M2s7hvdTzDBGyrtSAmzpJ+s5wfgsPzqbSRiLYZBAbj9WkwYI08pLl71g5c61wocMXFE6/pgnQKJMysBrKSB8ltim5ltxJpgUWXv5SLPJS63gz0C4bOCKeNExmUV29xE4w8rtGCIPVXik7TVGDD0KCeaLAc0EXElugwXb5yRTeFRme+XF36HiyTa6ZSr5FQWCbrw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbrxQaQ9XQFypN2Oj9GBu6/I0u+XqheclA4qYecSDgU=;
 b=0vb07hb23wW0NP21axNArjJuWN2XxELC4eCJblbv/Jsp6nQMYVngl6DJr0RGxkwTrsDV1YuFrbuQHYg3owvwkp5zQbu6ZGbhbXQlPL91RToV0GmFhzeHwgmYClkX9r8aE2MVTAVqkA9Eut3ykTPrBXWYJRhJcz9zMYqEV70uqmo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com (2603:10a6:10:e1::18)
 by DB8PR08MB5116.eurprd08.prod.outlook.com (2603:10a6:10:e5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 14:18:29 +0000
Received: from DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643]) by DB8PR08MB4969.eurprd08.prod.outlook.com
 ([fe80::45f6:8d18:1b32:c643%7]) with mapi id 15.20.3109.027; Mon, 22 Jun 2020
 14:18:29 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>,
	Patrik Berglund <patrik.berglund@arm.com>
Subject: [PATCH 2/2] arm-bsp/scp-firmware: Build SCP MCP firmware for N1SDP
Date: Mon, 22 Jun 2020 19:47:35 +0530
Message-Id: <20200622141735.4951-2-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622141735.4951-1-khasim.mohammed@arm.com>
References: <20200622141735.4951-1-khasim.mohammed@arm.com>
X-ClientProxiedBy: LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::30) To DB8PR08MB4969.eurprd08.prod.outlook.com
 (2603:10a6:10:e1::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LNXP123CA0018.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.25 via Frontend Transport; Mon, 22 Jun 2020 14:18:28 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: edb8db2b-9b32-42be-0629-08d816b72730
X-MS-TrafficTypeDiagnostic: DB8PR08MB5116:|DB7PR08MB3418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3418937E980AC5BB431AC1B2FA970@DB7PR08MB3418.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 q39PIihB1YlBqIF1B/JVhw6emw5f9jseN7vMGWo0fBWOmUDREytcPszI9+Khf6D0sHqd4BIIf4Ogeegk5gNc4SDrrV8qgbCrZ6BLsJEvyD6fTidg668uzHQ0xatehDOiancopUTrt3ZGMV+VVxOpo39yPtPcKNPfI4L0jNiRvI9DDKRk9elxkBgG9JmITtBkULIiHB32LnzkvlDi4kSLNYtyA73k6Q9ktu3700dVEh1HMLrWq8Se8lqIhGvnNUlecwnu+jM5p+XOAoP3D1HKALOEX7yERE2PXfm5PvRHWBEb7dHiq5xFUKBzIwDaAaQZrpaOBV5AxchuV1/pe0+L7gOomTXqoPgxYHioikqgbAIUcCYm6WqLegqosfUEXUo0AD8vSBQNJa5MxE5KhcdzVg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB4969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(66476007)(66556008)(66946007)(26005)(1076003)(83380400001)(7696005)(8936002)(36756003)(6916009)(5660300002)(478600001)(52116002)(86362001)(2906002)(16526019)(186003)(6666004)(956004)(2616005)(54906003)(316002)(8676002)(6486002)(4326008)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 WkjX7UlZmmDyTwwY9L1YvmubBwANKDkJGnBCTgPs9xj5GFJFFPGed+tQyzdj9YG+vnLbZSXrOdi9HKwrSgsHtvY8vD2YGIQRJRpoTaZdDPfIH3LyjN0iBzY+VRqs2stg1cobGX/pOt7l52j/sB79weH3vC0ydpWl4JcEct4cqzmagtGMmNP+MsEK876L1qWy/2YePO4o48h3T+LHwv7yhbpqtG2Iwyf/N4alx35sA2YdLPaAKRtXbum1psq0ZsBy+mmPwnHg/aZxEj2JF2GCMSPiusCAgrpPoIkQ/twbIsSneb0Kdns/tqUmr84SZiGcmm0sdY+yr1fHfQFK8hXBBMm0FfxLdZ1SKfHVMfkmGWKM5blM7NMvExKDUqirGtMyQ5RgyPiiriUq3/ftSAsOtt54ONKU2ObVPvfmeFZm0yZ8UlUA/V1x2/c6gR1AdOVYucfCCXrHdg3kXDMA6VUOYcEn2PUasyqW+1lUibTHqnS4JsD4OYmYr0XZ1BlGNUlf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5116
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(7696005)(5660300002)(478600001)(1076003)(6666004)(6486002)(47076004)(4326008)(316002)(956004)(70586007)(2616005)(70206006)(186003)(16526019)(54906003)(2906002)(86362001)(26005)(81166007)(83380400001)(336012)(82310400002)(6916009)(8936002)(36756003)(8676002)(356005)(82740400003)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0e2b84fb-57ba-4b46-d2c7-08d816b722d3
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pWtSYsLZpoH97S40A/SkZBbml8ewKpPZrR4HQlpzEn38VEISX3/PkEhpHczMq0Pb+4iKpYqwo3PCn8VU7pygUSxoUnm4umyDuwNpJT6cv21KlZ9yhjsQ0fh008vi8U0BXWi9TmCXXoiI7hV5URzSkjxvGNGrEBPiBrGKWxyo+Xnr9RgWYD56YAgx2yWgjsFVwfDM6OQc7KMsX3fN1tD5Z0a4DDtP160pHlH6+n95KEk6NE/Ooc/XBgeH9KylMYi3ZBqRCg4WrRkg2zi2PicqgALG6dOQ7TfUlKUDp00CgM8XfiWb3e+uOL0ymlSgAbY9Ha68yldWjLK1+smcFwRLBpGukYkPc90V7sD2fFcyI4oAfNB2ICKEHlGM36FngMTgtQmZxf/czuzmD+TqBGUwnIv1XyTjk85t4i1M9C8F7ffattzsZWOX3AGZZGNPaenk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 14:18:36.5140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edb8db2b-9b32-42be-0629-08d816b72730
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3418
Content-Type: text/plain

- Add bbappend recipe to build SCP and MCP firmware
  for N1SDP.
- Use fiptool to package the binary images
- Update machine conf to add image dependency
  for SCP-firmware components

Issue-Id: PLATFORMS-3134

Change-Id: I24bb427179f2fdee0a8351257c9088d8024ca6b8
Signed-off-by: Patrik Berglund <patrik.berglund@arm.com>
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |  1 +
 .../scp-firmware/scp-firmware-n1sdp.inc       | 32 +++++++++++++++++++
 .../scp-firmware/scp-firmware_git.bbappend    |  7 ++++
 3 files changed, 40 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
index 20eaf27..755bb09 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -27,6 +27,7 @@ PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "trusted-firmware-a"
 PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
+EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
 
 #UEFI EDK2 firmware
 EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
new file mode 100644
index 0000000..ddbaac4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-n1sdp.inc
@@ -0,0 +1,32 @@
+# N1SDP specific SCP configurations and build instructions
+
+SRCREV_scp    = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
+SRCREV_cmsis  = "refs/tags/5.2.0"
+SCP_PLATFORM  = "n1sdp"
+SCP_LOG_LEVEL = "INFO"
+
+COMPATIBLE_MACHINE_n1sdp = "n1sdp"
+
+PV = "2.6+git${SRCPV}"
+
+DEPENDS += "fiptool-native"
+DEPENDS += "virtual/trusted-firmware-a"
+
+do_install_append() {
+   fiptool \
+       create \
+       --scp-fw "${D}/firmware/scp_ramfw.bin" \
+       --soc-fw "${RECIPE_SYSROOT}/firmware/bl31.bin" \
+       "scp_fw.bin"
+
+   fiptool \
+       create \
+       --blob uuid=54464222-a4cf-4bf8-b1b6-cee7dade539e,file="${D}/firmware/mcp_ramfw.bin" \
+       "mcp_fw.bin"
+
+   install "scp_fw.bin" "${D}/firmware/scp_fw.bin"
+   install "mcp_fw.bin" "${D}/firmware/mcp_fw.bin"
+
+   ln -sf "scp_romfw.bin" "${D}/firmware/scp_rom.bin"
+   ln -sf "mcp_romfw.bin" "${D}/firmware/mcp_rom.bin"
+}
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
new file mode 100644
index 0000000..53bd022
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_git.bbappend
@@ -0,0 +1,7 @@
+# Include machine specific SCP configurations
+
+MACHINE_SCP_REQUIRE ?= ""
+
+MACHINE_SCP_REQUIRE_n1sdp = "scp-firmware-n1sdp.inc"
+
+require ${MACHINE_SCP_REQUIRE}
-- 
2.17.1

