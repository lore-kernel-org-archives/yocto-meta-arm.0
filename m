Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.55])
 by mx.groups.io with SMTP id smtpd.web11.1571.1592373754610160535
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 23:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RbuC+XnC;
 spf=pass (domain: arm.com, ip: 40.107.21.55, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkAHcQDxetCo0cs8JEQeQYoRViQ7ap1ef4H6EuaVTco=;
 b=RbuC+XnCGjrXVNJaIJgI33vRI/iiuAEkLaQS+FD8jnK1krYtIepxHuHwgGA6uofSUctoRhzWZLHQA/KQnf+6aYLpk2CUdMOJas/IciIUQqqbrQ4hxXocI4hGDHLX2/wBb6RZWkfTD4u9BQ6vXnsro3BjfhMDdxsNdOwomAGAvfY=
Received: from DB7PR02CA0018.eurprd02.prod.outlook.com (2603:10a6:10:52::31)
 by VI1PR08MB4558.eurprd08.prod.outlook.com (2603:10a6:803:ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Wed, 17 Jun
 2020 06:02:31 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::97) by DB7PR02CA0018.outlook.office365.com
 (2603:10a6:10:52::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend
 Transport; Wed, 17 Jun 2020 06:02:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 06:02:31 +0000
Received: ("Tessian outbound 830790f176a8:v59"); Wed, 17 Jun 2020 06:02:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8cfb6152a5ba3f6b
X-CR-MTA-TID: 64aa7808
Received: from 56ea94839b5f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 31F9BD9E-D142-48FB-BD89-02F093317063.1;
	Wed, 17 Jun 2020 06:02:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56ea94839b5f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jun 2020 06:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjUc+5FhgMWR9V5l/CDzYjU6vgA629E4EIIut0bybMj1ROMcmm5EtPyLnKRN9YtJPqWo7HTP08Eapw9g6QOLJghvXPmFpB61qRJ7F7+yakRtaG4/G0iAV3o4nftaFd/5A9x44oawgjy31ZCkjJMZ05tqETjWUgbPj9CjS7rR2h9np0oQxgwjjPz36KnAlviR6f6nR7M/7E12ss6V2UK/dfF94T45SWR3OvxFXPuffBvCxCLwiv0/fS8CTBJQSuNnDIw+CHJQfNglAOBSe3Jm8oTN6vZYZcg7rX7Rj722mUQTsiUXEDQlQEhrzi2JQdH3qDmGGhgCjJJOjLivSX6Auw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkAHcQDxetCo0cs8JEQeQYoRViQ7ap1ef4H6EuaVTco=;
 b=OfhYtUDs8lY53u/9jD2elByDL3/L+EfNAny63s0AmWD+IgXd/UuzpYN/qJGAq7XeNLaYnYLlbKndd1gsAbNxfXMfDvlnZ3N2SxvOXbFm0giwyn880f2jTY8LshASFG/U2V+wcOHV8AK1s2mhOBOoRWz0hE4RLYYw4z/JNdcYbyx4yl19BHScjKw0kAomKqSn3PHdP+3lbibJZHSZ+hDjpuLVXUFR7y1h8Vh+92mikOvsNYY+IkhiLuShV9Hh1UUJNLOKKurGxQcnzoc8kNDOnDJo2ycijBXOzHU3h4d9AJhgUgS9O/qznpmcpL5ftq+ZYjv5QRItv7Fafcw2ba07gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkAHcQDxetCo0cs8JEQeQYoRViQ7ap1ef4H6EuaVTco=;
 b=RbuC+XnCGjrXVNJaIJgI33vRI/iiuAEkLaQS+FD8jnK1krYtIepxHuHwgGA6uofSUctoRhzWZLHQA/KQnf+6aYLpk2CUdMOJas/IciIUQqqbrQ4hxXocI4hGDHLX2/wBb6RZWkfTD4u9BQ6vXnsro3BjfhMDdxsNdOwomAGAvfY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB4948.eurprd08.prod.outlook.com (2603:10a6:208:163::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 06:02:25 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::e04c:44c6:7baf:a3b7]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::e04c:44c6:7baf:a3b7%7]) with mapi id 15.20.3088.028; Wed, 17 Jun 2020
 06:02:25 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/2] arm-autonomy, xenguest: Fail if Dom0 is not properly initialized
Date: Wed, 17 Jun 2020 07:02:23 +0100
Message-Id: <1592373744-85392-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0412.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::16) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0412.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a0::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3109.21 via Frontend Transport; Wed, 17 Jun 2020 06:02:24 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b384dd6b-a2ba-409a-cd11-08d8128405f6
X-MS-TrafficTypeDiagnostic: AM0PR08MB4948:|VI1PR08MB4558:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB455881CA45ADA82A2D426D50929A0@VI1PR08MB4558.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 k92gWMXuUsO2toAY3NghLNon9WYxWkH0K7fhGiyHZ8Xz28A/PCpk328gb3VkfmNEXhQEpphnQxtg1GHfjNdISNnVAe6/ptD8+hUIxbb88rcXeIzq4pgkA5/dWMfcqg06pLO6L8StA6BMo+kjZlSsMDJ7IDcfIBZ5OjIIIhGh13hQRy1hbAQEQ+J8+fTiSRy8S6u1ryARMCdgXxSkSi1JVATdmwJEwvnhD2mi2fF/MhV3TACQuPusbYlYjxgNm2nAK0iUtoK4wRlDi70C8Tx+HJxEN6OE8kb3WJaLcqVh/8UlY5ayPF5PxnkwZmJZXj9RjVmKrrdXWLWm30dy0lWAvQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(26005)(2906002)(16526019)(66946007)(66556008)(66476007)(316002)(52116002)(7696005)(186003)(4326008)(5660300002)(478600001)(6486002)(44832011)(956004)(2616005)(8936002)(86362001)(8676002)(36756003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 LeBZ2RONCHTEcIGbcWidfpOpEsmLJ+s+3aaLXLIOhSrGfiCsAolEAOScDULnNsCZ/ofWgUekJ5Q7NvBKd1883/bxBwQaiN1FO7PKTZu4sZVdR2rfTKV+RigEI5En8wm+f/jaCOoRtrw+Ht92iPiuNxjUy2SyvB4oal1tnL5Ge6VWGrm5kI6mnD2Q55sDaxfyLI12BHsDVBLWvT3XokXrS+0aLh6IieuecObdXUMnMI020GBjoGe+9jH205plyyl47dKXdsszWoyU23lep5EAO0vxO/byh0kor3/VmMA526PwAEFZQYDSlEvDjdWYFOpPfLVVlSR7F18HNURjcQXA4qYmttE1817PEkK2zt3hXhQ76BmlH4/G7GekRzFqxRElPkG4YOmVr22ueSdcbjlA4mwyz3D0JG3UiTPOTxL51yJGhkQH6oR6XsXQDxzo9mOLEUBpdL9fucneCLjlkt6i4oVwqrJf/6W2bXOfDNXUY5L3bXkR9mi8XYUrPhRBhlm6
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4948
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39850400004)(346002)(136003)(396003)(46966005)(70586007)(6486002)(70206006)(82310400002)(86362001)(4326008)(356005)(8936002)(81166007)(5660300002)(44832011)(82740400003)(8676002)(26005)(186003)(336012)(36756003)(6916009)(7696005)(478600001)(2906002)(956004)(316002)(47076004)(2616005)(16526019);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	41d565ea-3f71-48f0-de82-08d8128401d0
X-Forefront-PRVS: 04371797A5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pwQvgk4ETvB75qib1VEyZLRIkFBSY7YHxkx/GVUF7+7bN5Hag/aGaC1+U6NITOvrAi/T+bnX5TpBVyGoZWdZWKeMMLli5ZXJjTtY/6EYDS12DtKy7J75iLCMI3Hdf/pKuI3mhz1BaeS8JJPR0vJeW3nKOORi3K16gjSBH3lWUEcR8b3zLNAmc+90OJF1xaUMKCp8N0Jqg2In+bwE4w4pGjw5p0mU5VZ1B79NTUGbQcUhWuwzZVl1rsBUx/aH3uyJu/e/E6Ebyp9vZCJ59vKo3bVqqkr9l0gbTXigpJqQ2CfTySa2nKb025WPIMNda8+84glSNWhE45iOwLQGyIYDkLYbwU/q155dj6rjsipzYmrB7y1L8Z1kuzHRr8hFkQCj3xTeJhe37JX5wPgW1L2x9g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 06:02:31.7898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b384dd6b-a2ba-409a-cd11-08d8128405f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4558
Content-Type: text/plain

During the xenguest initialization and when invoking the
xenguest-manager tool, abort the execution if Dom0 was not properly
initialized on top of Xen and with the proper kernel configurations.

Change-Id: I307c03e58a266a943968df1bc5ba39951912d2cb
Issue-Id: SCM-996
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-extended/xenguest/files/xenguest-init      |  3 +++
 .../recipes-extended/xenguest/files/xenguest-manager   | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
index 9563d2f..cd249cf 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
@@ -12,6 +12,9 @@ fi
 
 source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
 
+# Make sure we properly initialized the Dom0
+/usr/bin/xenguest-manager check-xen || exit $?
+
 # Create guest list
 guestlist=$(/usr/bin/xenguest-manager list)
 
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 99975a2..6a10d35 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -566,6 +566,24 @@ case ${cmd} in
         usage
         exit 0
         ;;
+
+esac
+
+# Check if we have a valid Dom0 booted with Xen
+ERROR_MSG=$(xl info 2>&1)
+if [ $? -ne 0 ]; then
+    echo "ERROR: Xen environment is not valid!!!" | tee -a ${LOGFILE}
+    echo "ERROR: Check if Xen has booted and the kernel configuration." \
+        | tee -a ${LOGFILE}
+    echo "ERROR: Output from 'xl info' command:" | tee -a ${LOGFILE}
+    echo "$ERROR_MSG" | tee -a ${LOGFILE}
+    exit 1
+fi
+
+case ${cmd} in
+    check-xen)
+        exit 0
+        ;;
     create)
         guestfile="${arg1}"
         guestname="${arg2}"
-- 
2.7.4

