Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAC5C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 14:12:00 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.40])
 by mx.groups.io with SMTP id smtpd.web10.12259.1635343919000830896
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 07:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=rG2AwRvK;
 spf=pass (domain: arm.com, ip: 40.107.7.40, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5wQnqeQIjwHghUYc6nJlq/QUTXI8xguZotooqS12vg=;
 b=rG2AwRvKP2FcSiH9wPuPpwfHMaPcJBJTBMUQHgTOHpSgoqhBT5vnNz7qEoP9b28g4vOnEky58h8KxXf/EUxafRvnmfqa+HHlWJpRa0kTixbGf8loEMqRB/jdQ7HrLzuaTXuJp2kJW3MeL3uiAvadzVc2q3OR4D8VLwv7BVi1LIc=
Received: from AM6PR08CA0039.eurprd08.prod.outlook.com (2603:10a6:20b:c0::27)
 by AM9PR08MB5985.eurprd08.prod.outlook.com (2603:10a6:20b:286::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 14:11:56 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::d5) by AM6PR08CA0039.outlook.office365.com
 (2603:10a6:20b:c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Wed, 27 Oct 2021 14:11:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 14:11:56 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Wed, 27 Oct 2021 14:11:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9efd14fc87a93f20
X-CR-MTA-TID: 64aa7808
Received: from 1e907bf3cc81.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 946FF906-E6B3-458D-AAA3-917D27DBFF5D.1;
	Wed, 27 Oct 2021 14:11:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 1e907bf3cc81.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Oct 2021 14:11:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPBtOhpGIxI1j93v7gfyQs3EBXwCTyBQz/fgCFO0v0rUDItPwxZ09RUc3vhjIEovV+ztaGd2MVqXHWS+MBbJPLP/DtGkHw5Wo4B77sojWZWW7uFH443kBllJuUds7Hpq+wiM3RLDEPn2Ja3G0MQmDHT4qrjgkkBcl8oGggaTg4pNd819gc6oFBGkDGgCMAhXsI4DDxcHjwrJWNKsjDkJ1greAgFtiWa3JIr0XDj3K7Qgvih6MF5WdbwgxGIgrLCWznzxHkuHnYx7jHNG35zPbedY6ZdrSUk+56UnnMmygu6NpP02vpO2+9ypIrJ6A6MqrFJ3NvvPYlWZwliX0pJzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5wQnqeQIjwHghUYc6nJlq/QUTXI8xguZotooqS12vg=;
 b=FalvB68k8epUSlQYuAgP+K6fzvWYzJksNhUoN/UAEVf2XgZX/fzTAnlWpZ+p20+ecC7g/CQstPnVdTtPIjNuvP+FgYcmgpK8hHJS/v147phV99/nEMyQr7mPMp9DYhR6w8ajtbBr0ycLUUZYVL9TEucGvKnV6dJFOsmrLX95rMxaN6dDek7/oheWSabBGzr3YYV8cF7+torL6Rq+YsK54wnPQZq+q6BcycPq4+yUJyu/UjHxvP7ED6IYZisnp4hscyDpOU7tzmWj86/WIl+hGT/XYTWkOaOmj2mRg1Gtg5Ugh3ZQ3aKTf/gxydWZ6m74SWJ8oCCsAhiMPKu8UgRubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5wQnqeQIjwHghUYc6nJlq/QUTXI8xguZotooqS12vg=;
 b=rG2AwRvKP2FcSiH9wPuPpwfHMaPcJBJTBMUQHgTOHpSgoqhBT5vnNz7qEoP9b28g4vOnEky58h8KxXf/EUxafRvnmfqa+HHlWJpRa0kTixbGf8loEMqRB/jdQ7HrLzuaTXuJp2kJW3MeL3uiAvadzVc2q3OR4D8VLwv7BVi1LIc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6006.eurprd08.prod.outlook.com (2603:10a6:20b:29a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 14:11:42 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::ecb2:1815:d244:58ba%7]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 14:11:42 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] arm/trusted-firmware-a,fiptool-native: Fix fiptool execution
Date: Wed, 27 Oct 2021 15:11:32 +0100
Message-Id: 
 <24874c5dd1d98f97a3fdbcec773e8821eab83107.1635343843.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0481.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::6) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
Received: from e120809.cambridge.arm.com (217.140.106.51) by
 LO2P265CA0481.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13a::6) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Wed, 27 Oct 2021 14:11:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4596cff-adc7-43df-c253-08d99953bbde
X-MS-TrafficTypeDiagnostic: AS8PR08MB6006:|AM9PR08MB5985:
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB598557514CC5ADA1871FCA3D92859@AM9PR08MB5985.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:113;OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IiT6hUVXVQI3NoTseXyb+4FZlMK43viegqwbjIxhf98dVJ77JPdgOLRxrDLQHPMc/fxmsA/i1W+BfZpxJVqeW2V52m/wuAWicmzMGJvuQfMHiXgpopqCdwd+LjCDSWZtuB3SI4iu3nmA6Z8uERdgLKQ/zZtWjjDnz3/MClq/FeIo0LRt8Wl65YMcYM4gl+GI0dXfNWHgSwu+rGMF6B1MgbPXK3XfYFWg/qNA+tw1CmIbg2BRoDoTBOt2kHV6JAFXWgLNqChkqr/SzwHYQ2gub/E7VoS6ENa1qtLmEVXtwvVooFU3HH0I+MHZwwQrIXVNhUbq4Yj6FFM1YIDZeg++6rIhz6cfjdLaZKD29YeDQGtOBsa+ow3trERefPNPai9m8l7BwNo1WdcfNUZ/j54U5lbHoiI6SiT6Vul791Zx2qrld/cRwpJqQPjBKEVXglWlaVF9F4ApZZh+qjDTpLPE5Ng71BNMI2v6BgeW170DiLSy3ODXLc63CAvd9nYtbZoLlnaOBK55pGmI6Vioryb9yx6drg1yjdgOjwHXKmAIJ5FxvVIAEp7BJCeqoT0fOKauG+BDDr/Y+x6iY1zaGl7EWc1eYDQcFtoFtUuvbqGLFJez8p4QSp1hXMBRAZqvu9lQf/2t8n+HNUp8DWwjV+CtYihS54mvr+xe9n6zbhx4VZDqfDfG456yYEkAo3DUdA/YaiwxibPcslo1Owo/Q1twREIZEx6EUUPkWnRlVsww5lW4pccAi0eFoOqH3ZCvdz0HlxIJdcJ3w3S61BqV8S0Gs1IwGOSui6S+eDwcM3PMrk8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(956004)(4326008)(36756003)(8936002)(316002)(2906002)(66556008)(38350700002)(508600001)(66476007)(44832011)(66946007)(5660300002)(38100700002)(86362001)(52116002)(966005)(7696005)(6486002)(6666004)(26005)(186003)(6916009)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6006
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	864142b3-90eb-406f-e4da-08d99953b346
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1UWG8cvprhJMwtjuVgvz2mAGNge9E2lkNXODFPIKFBod9AtQvEqPeNWNaPKnHNp2ZOBFiEdKrIbZCwK4VTuRwvN2czKxieB9uyq6PwGPKHDNhPSTHm4XbQM0EUKQXF89RNWWBs7dB5VrlHfuKFL+DId/cIJoFB5RMUv1lK5+CG+sRsB8qlAQVTPOQnHb0pNKn5CcjyvzHaQzwvr0B85kKehezso3h7mYsnGT2uG1BODHD4im7rwBGLBpOuDI+C9zTzcwaJmfnfmqQULqCilJaU7ovQHqv5on+K5dvUqgZV/Ti70TkukTGaQ2uMETE4m1NnIURtQJiWPesafYo9Ue2A2clWaV+iySCez8uF2F5j4AqNAjnHYHY9hKAQFL13rMHx4g7ysC00iGF2Ul82ZL9wZXMk7IHbitrjVdJER9JhS83SkiTze6BLgyBtHVWXpa5Mlzpj/U8c20vV0c5Lf9mFigEoQSIsNHg0plROuexT4tP9JwQNEHEz6paBHwPli3psz2IDJl1MCvSQG5FfX3v1+T6440bMmku/7ZwFyYBgZaKxtaOR6UkNTn7y8E/vOy6+CAsoLr51tbMSwy6uG3diekJ0t4PZOtBIBJ8ZGRlQQmvoUKCEi3gQiTx24o6wJY2kRekBVvSt5O/ezVkXzPHfss2PTh9dE2dxD177H1LcXfIEIs/EWKMwyinexKO6kJEATODd8WaUkIcEJCyOfINbaU3HM0+MYOK+/Y/+4mrOxTa43a0OWK4gJSm9p6m0WzkUO3GqaXpBOePG7Zk1eM45Wyl5zIt0J+sXgBfsBZtFg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(336012)(6916009)(8936002)(5660300002)(82310400003)(36756003)(6666004)(2616005)(44832011)(956004)(70206006)(6486002)(2906002)(4326008)(36860700001)(70586007)(86362001)(186003)(356005)(316002)(26005)(81166007)(966005)(508600001)(47076005)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 14:11:56.2279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b4596cff-adc7-43df-c253-08d99953bbde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5985
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Oct 2021 14:12:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2304

After http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=648571b113b39420735859461fcd69cfc6f66c76
the fiptool create command fails with:
    tools/fiptool/fiptool: error while loading shared libraries: libcrypto.so.3: cannot open shared object file: No such file or directory

Put back the inclusion of BUILD_LDFLAGS to fix this.

Issue-Id: SCM-3548
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: I8bfddd0528d5c4dbf5dfd87c9ae17db4e0071b1c
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++++
 meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb       | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 36bd037..3c4cd58 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -152,6 +152,10 @@ BUILD_DIR .= "${@'/${TFA_BOARD}' if d.getVar('TFA_BOARD') else ''}"
 BUILD_DIR .= "/${@'debug' if d.getVar("TFA_DEBUG") == '1' else 'release'}"
 
 do_compile() {
+    # This is still needed to have the native fiptool executing properly by
+    # setting the RPATH
+    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
+
     # Currently there are races if you build all the targets at once in parallel
     for T in ${TFA_BUILD_TARGET}; do
         oe_runmake -C ${S} $T
diff --git a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
index e733ff1..9ad1166 100644
--- a/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
+++ b/meta-arm/recipes-devtools/fiptool/fiptool-native_2.5.bb
@@ -19,6 +19,10 @@ inherit native
 EXTRA_OEMAKE = "V=1 HOSTCC='${BUILD_CC}' OPENSSL_DIR=${STAGING_DIR_NATIVE}/${prefix_native}"
 
 do_compile () {
+    # This is still needed to have the native fiptool executing properly by
+    # setting the RPATH
+    sed -i '/^LDLIBS/ s,$, \$\{BUILD_LDFLAGS},' ${S}/tools/fiptool/Makefile
+
     oe_runmake fiptool
 }
 
-- 
2.17.1


