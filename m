Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web12.513.1606239591446274438
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 09:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZGUEjFYh;
 spf=pass (domain: arm.com, ip: 40.107.21.81, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhbKJBWSE7oO73WiIzaILRJLTbr8ycRfZbMOrZGfW5U=;
 b=ZGUEjFYhTuGc/rUQtVpbai0VtOZ9wX5NZly2Qrn6m2cRXBYyamRcABuTqrdCrrqMdtf6VYMstZDghH7z+mr9qdjdaXgsmQZvNrvTK+YGh6/CvY+Mpre1pgspaPwjOM5kHb/bdl7z4V+MXiqqVBdIcARel/r8xwdrQvs91m3Ov9s=
Received: from AM5PR0701CA0011.eurprd07.prod.outlook.com
 (2603:10a6:203:51::21) by DB8PR08MB5387.eurprd08.prod.outlook.com
 (2603:10a6:10:115::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 17:39:48 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::2c) by AM5PR0701CA0011.outlook.office365.com
 (2603:10a6:203:51::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.11 via Frontend
 Transport; Tue, 24 Nov 2020 17:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 17:39:48 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71"); Tue, 24 Nov 2020 17:39:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e3c9007900feffc
X-CR-MTA-TID: 64aa7808
Received: from c9b7051a18b1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 253B3F7F-8094-40DE-91D6-467E2AD35B32.1;
	Tue, 24 Nov 2020 17:39:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9b7051a18b1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Nov 2020 17:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLTYfE/D2sgQIAIcZvccoVAmpc8To6z02/lfmMHeojWNOPyqK+U5xQTCw9/RMqzGrk99E2nCkeJbL9cbP4eRlQBeDk9xAO0WKg2vClFS2UYgt4WvESo6YCKZrwQzISWzQOY5I1TyoWCZk9rBnecG4MvhOlRJHE+dNqRrxJqvkzXfBa/kvSWV/mKIFH+hlRLtMQ47KjsOjA/mb6G3IpHitJIciVBmuzfRNIlJTMRuP9as2h0S6A5XuDPCON469OdOqmwpONR45eObGObhLvs0vuDP3xjv3GrQNWYNAHThRDi2ZioEfwXoA/EiqJ00ZYt3+MyAFDPFPSnYn2vi9spZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhbKJBWSE7oO73WiIzaILRJLTbr8ycRfZbMOrZGfW5U=;
 b=b6E5jAXdMbkmH3y4GSySgfL84kis3WwA7qPABXTfVHRiwXWvwTfnk2FUNwvgHEME/zh6C2rpfsOeSLa16VwEK9N6XyUM7qSsMqt9gZ0BHWIvI9B14JyE+SUzAY+RH4x68PHRlXavXCEsGefqb+TrOt1Cic2vAn2v02CYzpMBPeEplB1y8WNj+V9cKw1+y9B7fumOapY4ibvDLcvvJCiRj8G9rAFr8i38ieHp/EKi1YuMMIEyLCL831O3q6+cqXB/Yo3b0L9VYBtYhH6JlUhZNlKMAPkrCTIn/H7ZBP+dEXoRPCLJXbzMLlKwhLLwgjCZYgBrvjCflCOCkmM7xpA23Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhbKJBWSE7oO73WiIzaILRJLTbr8ycRfZbMOrZGfW5U=;
 b=ZGUEjFYhTuGc/rUQtVpbai0VtOZ9wX5NZly2Qrn6m2cRXBYyamRcABuTqrdCrrqMdtf6VYMstZDghH7z+mr9qdjdaXgsmQZvNrvTK+YGh6/CvY+Mpre1pgspaPwjOM5kHb/bdl7z4V+MXiqqVBdIcARel/r8xwdrQvs91m3Ov9s=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com (2603:10a6:208:d4::18)
 by AM9PR08MB5953.eurprd08.prod.outlook.com (2603:10a6:20b:2d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 17:39:38 +0000
Received: from AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068]) by AM0PR08MB3409.eurprd08.prod.outlook.com
 ([fe80::105e:371d:a567:a068%7]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 17:39:38 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Khasim Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH v2] arm-bsp/n1sdp-board-firmware: include RAM firmware for secondary device
Date: Tue, 24 Nov 2020 23:09:26 +0530
Message-Id: <20201124173926.23689-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.96.140]
X-ClientProxiedBy: LO2P265CA0120.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::36) To AM0PR08MB3409.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.96.140) by LO2P265CA0120.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 17:39:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5e8bad6-9ef5-406f-68ab-08d8909ff07a
X-MS-TrafficTypeDiagnostic: AM9PR08MB5953:|DB8PR08MB5387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5387D0341C6B95A509130283FAFB0@DB8PR08MB5387.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:418;OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Q7aE+escGO6EBEUav2XXznHejYoghhQpmg1p/NJvpIh3br+xH8x6rreIAEXOgdJ12FuqouKKEokjoEmEA5Vuf5E4p5+33QHtXWH9Qd/0W0TDz1D75oVvaGl3UqDiVvTrkg9dp+kMPAJMrbXGfxj46mRmSWzgJlLi/jS18c4B0DUOeVvDQqt/B8jLIj0mdIWSgTpCnrGcPxJZ/SnHHPLTPbV+UZYnnj3NgwGKjlGrLuMB+gxFsUOUqZpdVCycw4mHl0r45kH1i+N7/+DxLg30rd5eCmi7IfseH7AdwA36qF1335JHm0LJ3j+50SxWML7/0xX9+Mn9qespN6T2+oFNRZqQFMpovu6JpXJtd9QVNJJvDKMT/ONGF3JGpxq2Pl7ra/oQdRDNVFGpPjJHek79gQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3409.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(5660300002)(66946007)(66476007)(26005)(16526019)(4326008)(186003)(36756003)(1076003)(86362001)(6666004)(316002)(6916009)(83380400001)(6486002)(478600001)(66556008)(956004)(2906002)(52116002)(8676002)(7696005)(8936002)(2616005)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 gyMpOROiYHqjV/v4G+UpE4JIWSf6OR468gSwuiqcyLYf0nUvsK2vXR7Z7v+u+VY4hUo7bqKaVL6ex2ue+l0bL+t98Md1ltPaCJJGiGWe6828fGjCcHi49mcFDVQ1QGeMiGlHJd1JbvA55QyhzaG+iKDPou1j894BEdW0Z7zQTy8HZTb/d1d9Z7+Ho4b8OD/qeGMoY7Cp2trqSnO4IuCAH4/X9YFwEixsgkNO2d0eu8+etYp7MMW9ZlZxA5FWMSkllIHcTkA4cdl3PAKkIgpR1x/97KSris8XtZqQuBZv8ibPVzq5/GX5NBQIK5sCWGH5ULtx7fEeoV30RMp3evk2sp70acoysxy4sF2YpO/GjQEmjLJ/6wpuwteQi3UOKH9NVOoGIUlcCwxOR8yDJzDH9TMHC/QPiD37jnOOQM7M73X5OTlO0qkLj3STba1Gjvwvy6+szBsbfNWHojmq5lnz0F/adtuwQpZRLjRQmpRJE3FfEVsuI5C7KhCUsFqjtA5QN/xjDpcAEGLhzK4XG/NVnEiwxpSWyY5C+Vx58IVq2FXv11sRnHoI0eQxRGRpLwoih0ceYj5cOS96/5He5jTdixTMnCJnVBBgIgXJzRLFk0b4ggd6ndkHZ4HHytaoiyOOEazbB7qv5kVqLRx4KaRqBXsUtj1d0+tEiI/H2k+yJX9lCwD80KsTrmA2z6eZ8gg7LuoCWsGexZUlRQSyiMRQldbJe/RwP2QNLg9nkahJaNI8rbFhyIm/0sIia4P4mHJvKGjrdIbBemtcFmT2D1cVcBlhiXZZVuKh8Z8Lz/yGfxP4WXkV6FTjndA9TWXx0y+I+5xzudonm6lBu/n9v7+ZNKnoIpBlAkeNKRw+qszIOxfQHQAUKVlwdY0431hKNiDDe9ecut1lDRND4pHgvi/zDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5953
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f5795628-2306-4d62-4ad1-08d8909fea74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BjLiA9ajGzl3/bl6+077VdqOOeD9KGMntEITedU94UJq2g0TFopsGX6Fb/PSImtMzrKQnXAK+Hrveaba1gv/e2ExCq7J+geE4xvqt9DcTqrSLmd509yj1ToAzxTnf+PA3+5HnX424h9VRsjG91LjfP7OKoWxl9nxNXWmQ0yCPXl4aE3+A6RDL68qlvXjqHyKjw3mZxjYsa/GTS38CQwQvNKAL7cQzU8GcFpO2C10mvaKDeQ21wjsArdEIruQ31MlvafGbcxMRzc8xoTuBfoejObDfad/VUG+w7vUMGXV2QqV6NqQVdw/4cUrBgQPhRc7uck8yIyZLMMt3OXLw4Y4Uoe8fCzu5WWEIPXy3mwHHAuhzwP8dLlWp8m62+8lt2pfIJbflA6zBS2NkfRaTpZ2M676r6EHPV9vPOb9ETPQ3AhiBHdUKpnUCc3Wj6PeN9qW
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39850400004)(46966005)(26005)(82310400003)(5660300002)(478600001)(4326008)(6486002)(8936002)(82740400003)(47076004)(2906002)(16526019)(8676002)(6916009)(956004)(7696005)(316002)(2616005)(186003)(356005)(83380400001)(36906005)(6666004)(70586007)(336012)(36756003)(81166007)(1076003)(70206006)(86362001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 17:39:48.0899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e8bad6-9ef5-406f-68ab-08d8909ff07a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5387
Content-Type: text/plain

From: Khasim Mohammed <khasim.mohammed@arm.com>

While testing multi-chip mode it was observed that n1sdp running
as secondary device needs scp and mcp RAM firmware as well.

This issue wasn't captured earlier as QSPI flash had RAM firmware installed
and it doesn't get erased automatically therefore the device was able to
load it on every reboot.

Change-Id: Ied9d24429c7025206e35f50c8e5b6f090a590015
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 .../recipes-bsp/images/sdcard-image-n1sdp_0.1.bb | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
index 13fa560..0ef68b9 100644
--- a/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
+++ b/meta-arm-bsp/recipes-bsp/images/sdcard-image-n1sdp_0.1.bb
@@ -18,9 +18,7 @@ FIRMWARE_DIR = "n1sdp-board-firmware_source"
 PRIMARY_DIR = "${WORKDIR}/n1sdp-board-firmware_primary"
 SECONDARY_DIR = "${WORKDIR}/n1sdp-board-firmware_secondary"
 
-SOC_BINARIES_PRIMARY = "mcp_fw.bin scp_fw.bin ${SOC_BINARIES_SECONDARY}"
-SOC_BINARIES_SECONDARY = "mcp_rom.bin scp_rom.bin"
-
+SOC_BINARIES = "mcp_fw.bin scp_fw.bin mcp_rom.bin scp_rom.bin"
 
 prepare_package() {
     cd ${WORKDIR}
@@ -33,7 +31,7 @@ prepare_package() {
     cp -v ${RECIPE_SYSROOT}/firmware/uefi.bin ${PRIMARY_DIR}/SOFTWARE/
 
     # Copy SOC binaries
-    for f in ${SOC_BINARIES_PRIMARY}; do
+    for f in ${SOC_BINARIES}; do
         cp -v ${RECIPE_SYSROOT}/firmware/${f} ${PRIMARY_DIR}/SOFTWARE/
     done
 
@@ -49,7 +47,7 @@ prepare_package() {
     mkdir -p ${SECONDARY_DIR}/SOFTWARE/
 
     # Copy SOC binaries
-    for f in ${SOC_BINARIES_SECONDARY}; do
+    for f in ${SOC_BINARIES}; do
         cp -v ${RECIPE_SYSROOT}/firmware/${f} ${SECONDARY_DIR}/SOFTWARE/
     done
 
@@ -59,10 +57,8 @@ prepare_package() {
         ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
     sed -i -e 's|.*SOCCON: 0x1170.*PLATFORM_CTRL.*|SOCCON: 0x1170 0x00000101   ;SoC SCC PLATFORM_CTRL|' \
         ${SECONDARY_DIR}/MB/HBI0316A/io_v123f.txt
-    sed -i -e '/^TOTALIMAGES:/ s|5|2|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
-    sed -i -e 's|^IMAGE[^23]|;&|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
-    sed -i -e 's|^IMAGE2|IMAGE0|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
-    sed -i -e 's|^IMAGE3|IMAGE1|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
+    sed -i -e '/^TOTALIMAGES:/ s|5|4|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
+    sed -i -e 's|^IMAGE4|;&|' ${SECONDARY_DIR}/MB/HBI0316A/images.txt
 }
 
 do_deploy() {
@@ -81,4 +77,4 @@ do_deploy() {
 do_deploy[dirs] += "${PRIMARY_DIR} ${SECONDARY_DIR}"
 do_deploy[cleandirs] += "${PRIMARY_DIR} ${SECONDARY_DIR}"
 do_deploy[umask] = "022"
-addtask deploy after do_populate_sysroot
+addtask deploy after do_prepare_recipe_sysroot
-- 
2.17.1

