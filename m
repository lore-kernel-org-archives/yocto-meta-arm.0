Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.65])
 by mx.groups.io with SMTP id smtpd.web12.49913.1597080761160900600
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Aug 2020 10:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=6L7Vl28F;
 spf=pass (domain: arm.com, ip: 40.107.21.65, mailfrom: prabin.ca@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb6p4LC0FO3z+JpP3vRSZjsGj9XfVBE3YigFVzm1WzU=;
 b=6L7Vl28FaSPosOFOnuCZZnc3w1FQ9xmUVE//n+PF5jwKVrvSUIiWYrrUi/yNAJghJvgHJTI8tIstu0lQVWxYN5dQiRLAT9dsB049x57UWP6iYyUwqNMbosBCqI1D5rKBiN4Fyv7mwC9BPH8ANs4BJQinio0lUg9u3UwBxqFvb5I=
Received: from MRXP264CA0041.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:14::29)
 by VI1PR0802MB2477.eurprd08.prod.outlook.com (2603:10a6:800:ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Mon, 10 Aug
 2020 17:32:37 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:14:cafe::c7) by MRXP264CA0041.outlook.office365.com
 (2603:10a6:500:14::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Mon, 10 Aug 2020 17:32:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 17:32:36 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Mon, 10 Aug 2020 17:32:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c74c1c9b872931da
X-CR-MTA-TID: 64aa7808
Received: from e49bef8f4d4c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4232A6AF-6C57-4EF5-A0F1-EF4130FE1E2C.1;
	Mon, 10 Aug 2020 17:32:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e49bef8f4d4c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 17:32:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fE8tF/han7xUzDbrIC3wdmb5Cl9/zY4qPzIOw62hrNniu0TsvJQ3nYp4KA0jwERhUi+3p2T4FnfnKFB18vSFvncicpOwPKCY+YBpkDu/mHKgKwZGrfQ9KM6itIf20K7ixh8TPYKI1/3b4tnZtnvL4O6XO5LzXmqFqrIENtlJp6JTtkc5NJIEX2ozwVL9BLskQH2dQmSpfWLOGkBiC/05X1yWKL7QPpAc2chdFPDe7zBIa9pLuoO6QliKPPwyjkkPTxfdGhMfChUepGGrX1dUD10QFQzBUOPeiZKf5jDxeRo7JzAn68ShLUoGwweawY2WNIYPQqCBk4KB0FoD0pbaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb6p4LC0FO3z+JpP3vRSZjsGj9XfVBE3YigFVzm1WzU=;
 b=TUGGUGZ2r4zV7BdvMd6PRnkSK0oaVGRq1AtrU39riDAu3gIQqENkXcjd+UPSqJBbEXSgS93RJ+7IhSTz7y+3Sc5Znnb9Ikvsar2/cmVanfF7mAayzpNIkHK2iSe4dGQeuY0UWgsIOA7UmVreQ1TUljq+++DNDKCDceeSpVo/SmRuqqLjdCKbg4VIxz1gxOhjqvNmMzCbk5NI9TFIB6OUTJcUmEkp1PGwuBV6ji+uYGa7CM6gpP5KRhWqOy5ncvtMWlPko041/ELKHa+fbX47nkczPOlOAO6d7t7DPNRJU8axWhH/oZoKr/vUXI2lOAMkRU2AGarXpm7UXYT+txiPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb6p4LC0FO3z+JpP3vRSZjsGj9XfVBE3YigFVzm1WzU=;
 b=6L7Vl28FaSPosOFOnuCZZnc3w1FQ9xmUVE//n+PF5jwKVrvSUIiWYrrUi/yNAJghJvgHJTI8tIstu0lQVWxYN5dQiRLAT9dsB049x57UWP6iYyUwqNMbosBCqI1D5rKBiN4Fyv7mwC9BPH8ANs4BJQinio0lUg9u3UwBxqFvb5I=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com (2603:10a6:205:c::33)
 by AM0PR08MB3953.eurprd08.prod.outlook.com (2603:10a6:208:125::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Mon, 10 Aug
 2020 17:32:30 +0000
Received: from AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5]) by AM4PR08MB2756.eurprd08.prod.outlook.com
 ([fe80::6cc3:86b5:f5b3:89d5%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 17:32:30 +0000
From: prabin.ca@arm.com
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Prabin CA <prabin.ca@arm.com>
Subject: [PATCH 1/7] arm-bsp/scp-firmware: Build SCP/MCP for sgi575
Date: Mon, 10 Aug 2020 23:02:10 +0530
Message-ID: <20200810173216.10411-1-prabin.ca@arm.com>
X-Mailer: git-send-email 2.28.0
X-ClientProxiedBy: BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::25) To AM4PR08MB2756.eurprd08.prod.outlook.com
 (2603:10a6:205:c::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from a076760.blr.arm.com (217.140.105.53) by BMXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Mon, 10 Aug 2020 17:32:28 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [217.140.105.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 96691fc2-fe6c-4677-2f0d-08d83d535fab
X-MS-TrafficTypeDiagnostic: AM0PR08MB3953:|VI1PR0802MB2477:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2477E9FD2AD280F2B0446D0CE1440@VI1PR0802MB2477.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: s/9jeYOqqoJLXDdWOYMn1xmpYnMbcVbbQ/y8Zh0VVEtPa54nKbMJHQ3HeQWRAZogYH68PSqkGkNdoQeaZdafcTpNArPFIxS3YysMUwPnOSaWw015povJIzUEM8XshsYQZk2/yk2457kgDjjnq8kBHGT5YLtQrMLnLxzNjG97wcnr9l00yDCXC5yXwsLzxvekw0r4G1862IZsIN1Z6qhM6wh/rs6M0lT8K3coqDRtTedW4VDc6x9qd6cytiuIOvj/qpWI08splcl668XtRpY4qs1+vjASRxzZPPHmyIzOtzG6TW8RXrNcBunmeM35ilhYfDMyVKEP+rbKzWZHAYUaDw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR08MB2756.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(136003)(39860400002)(396003)(346002)(26005)(16526019)(186003)(1076003)(316002)(2616005)(8676002)(478600001)(2906002)(6666004)(956004)(86362001)(5660300002)(8936002)(52116002)(7696005)(6486002)(66476007)(66556008)(6916009)(4326008)(36756003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Yj38TxXZyEoStU8SuZSEFuxME4j7ZS+dQcCe3wms/wmIwFb1/0/rr60efg4pW9DsCEn85KLP3lwHVSuahCg7OaE+e5tAeGsYhrU+drAwdvefdDzoDcVopDx0FZAdjD3cJYrRZ0VfJp58Pf9+5d5C3arrF37X1GcyTjHG7t/nhq3T+YckySx6wfkK7UO6aH6bBdqXcqzKgICDXnEpgkxx+z6z0BzWe7txjX0OBRF40sT32odaWYxUIY/meTCTm78MDeI9D7/bmAjBGzzN38q/crFZHpM0WtNMaDMpok5nDNeSZpI6RpJskiCLELRTO6SZkUbm7M0T1ZW0ArdqLI8GLLdUZXTvDhTKNuDJb/YCX7xcj/ou3+vO5reuNbM8ouBXEZU8DARD7K11mrRB+4qjRV5+fSgty2n2P/PZCAIZYM8CwSD39DcOOrqFrId8hGRU16yvv+ldDbvotheSmdjYiVHKUoMCl7TYlbJVApVrXXyJRT30v09Mutw2jZx97y0FBVLCKDeqyz2XFS17ztNOvf5FJOfhcxLrDE0XFrQ+Cz8piOkSI5HJE+wGSlINuwqFsK7/JSiCNAkebyAbBSpws1RpAGf5ditTXe4AjbG19TCDlFVLQVgo55S2NIm04clyu4/Zn8VROan1TDl/7BiJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3953
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Prabin.CA@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	58db2442-ab36-4dbc-50a6-08d83d535b57
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GIap9i7Oqypr0BfIQi6hrGnqa57VbgqkPjc/bnJwlvJBkWrH0nZMkPs/oP6doQ1DxLANL8oUDt3tklvV/YWsqDUxyDFBKtHSZf/bBTbagTWHoZtltmBFOK4ZintyE0flUM86SAYQYy1u+ylQ4ZGOokqWjcKZNAo+h1TMCNWTiv5/5X4xEtJKt0yn1GhGbhzBLe0PIPLaKFj1rnTzWVc6Tx/PnC/SKvNDN9FiXItw5QuW1umTcveV7yiySC/gPZXxdp/9yEbx3xrtTw8jzzGPfHm2OUZgrosWMP7LbaO+LYdyMozzY/pZo/IFlL9JCum/tYVAMtomEC9bypBzC8rGXj1sytIwQ659vb9/GW3gzKldQPyOZ8qz00eaAUPVdUF4H7cZH0HhcFKQFKBh6dKGrg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966005)(7696005)(36906005)(82310400002)(316002)(81166007)(356005)(70586007)(70206006)(6486002)(47076004)(5660300002)(82740400003)(6916009)(4326008)(186003)(336012)(16526019)(8676002)(26005)(1076003)(36756003)(8936002)(6666004)(956004)(478600001)(2616005)(2906002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 17:32:36.8419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96691fc2-fe6c-4677-2f0d-08d83d535fab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2477
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

    - Add bbappend recipe to build SCP and MCP firmware
      for SGI575.
    - Add machine conf to add image dependency
      for SCP-firmware components

Change-Id: Ic888ee11178979e5ec068f85a5e0d7f2cabb7f5e
Signed-off-by: Prabin CA <prabin.ca@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf         | 11 +++++++++++
 .../scp-firmware/scp-firmware-sgi575.inc      | 19 +++++++++++++++++++
 .../scp-firmware/scp-firmware_%.bbappend      |  1 +
 3 files changed, 31 insertions(+)
 create mode 100644 meta-arm-bsp/conf/machine/sgi575.conf
 create mode 100644 meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi5=
75.inc

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/mach=
ine/sgi575.conf
new file mode 100644
index 0000000..04c4900
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -0,0 +1,11 @@
+# Configuration for Arm SGI575 development board
+
+#@TYPE: Machine
+#@NAME: SGI575
+#@DESCRIPTION: Machine configuration for SGI575
+
+TUNE_FEATURES =3D "aarch64"
+
+require conf/machine/include/arm/arch-armv8a.inc
+
+EXTRA_IMAGEDEPENDS +=3D "virtual/control-processor-firmware"
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
new file mode 100644
index 0000000..158f481
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-sgi575.inc
@@ -0,0 +1,19 @@
+# SGI575 specific SCP configurations and build instructions
+
+#it=E2=80=99s a tested tag post-2.6.0
+SRCREV    =3D "7a025658d8318e95dbab4259a8ff7834ae6d8061"
+SCP_PLATFORM  =3D "sgi575"
+SCP_LOG_LEVEL =3D "INFO"
+
+COMPATIBLE_MACHINE_sgi575 =3D "sgi575"
+
+do_install() {
+    install -d ${D}/firmware
+    install -D "${B}/product/${SCP_PLATFORM}/scp_romfw/release/bin/scp_rom=
fw.bin" "${D}/firmware/"
+    install -D "${B}/product/${SCP_PLATFORM}/scp_ramfw/release/bin/scp_ram=
fw.bin" "${D}/firmware/"
+    install -D "${B}/product/${SCP_PLATFORM}/mcp_romfw/release/bin/mcp_rom=
fw.bin" "${D}/firmware/"
+}
+
+
+PV =3D "2.6.0+git${SRCPV}"
+
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
index 33ae7fe..9594cb4 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware_%.bbappend
@@ -4,5 +4,6 @@ MACHINE_SCP_REQUIRE ?=3D ""
=20
 MACHINE_SCP_REQUIRE_n1sdp =3D "scp-firmware-n1sdp.inc"
 MACHINE_SCP_REQUIRE_tc0 =3D "scp-firmware-tc0.inc"
+MACHINE_SCP_REQUIRE_sgi575 =3D "scp-firmware-sgi575.inc"
=20
 require ${MACHINE_SCP_REQUIRE}
--=20
2.28.0

