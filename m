Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.57])
 by mx.groups.io with SMTP id smtpd.web09.27873.1605015731871159234
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 05:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EmYpfzAk;
 spf=pass (domain: arm.com, ip: 40.107.6.57, mailfrom: nathan.dunne@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFo8DtiF1KbBUg/jkjUoXwFMvnQOjThRwG9GaA9Wz6U=;
 b=EmYpfzAk89S6W2+ERBBlcYYxxPlQ7bc5JFy9iFYoqP0pG6Nmdf8773DtIE9AooEYCkQ09hpcpw0WS5qt8OCq1wGP2E6XP+a3BkGktX0hJB6qESQ1AmHe5K4uRAQCrQRzzMN/xvP+ovyqFGXoCaXvSbJbp8WmMhYjBZT+tn7bxJQ=
Received: from AS8PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:20b:310::9)
 by DB7PR08MB3449.eurprd08.prod.outlook.com (2603:10a6:10:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Tue, 10 Nov
 2020 13:42:08 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::a6) by AS8PR04CA0004.outlook.office365.com
 (2603:10a6:20b:310::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Tue, 10 Nov 2020 13:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Tue, 10 Nov 2020 13:42:06 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71"); Tue, 10 Nov 2020 13:42:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f977f0aba4c3a44
X-CR-MTA-TID: 64aa7808
Received: from 89966aeb4406.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C4C4DABF-8163-4A28-810E-8F5FA6CC4C19.1;
	Tue, 10 Nov 2020 13:42:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89966aeb4406.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 Nov 2020 13:42:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpJR4/WSefcCODRqCqm4QgSqcy9e1S3+oJpcdWn+Hq14GtcdJBGkrdq8fs0KjDmF2bRlBGf445iCBbLbM9sIgMJQ6hpYihBr9ew/dykUpHepv8vfpEbkbveBfiQ+quydJ+YhPqB0+xu/VVcXhJrB/FQVdv8VpngvAnffzJJcQdOE5eYV3q6cDuQMMZDWKb2vC2rP7HaoIVyUoFsWtuDvq2hx0zxw5iBzWYS/Ghof5QP3j0W+nEUtWuhbI4KyOaboJxHUC5rtTz0I0ksS0YOUTKRrfKZunrwGfRkObEdo0JTEvOPOE4zerUMhKhhdRKMpCdSlBqCsJWBuN8mzb6ULOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFo8DtiF1KbBUg/jkjUoXwFMvnQOjThRwG9GaA9Wz6U=;
 b=JUK3yXTRaVVxJg9buggXy3YGXvF6imq1BmqJIRmbKJdhQxuURubdjiD0G0BVKvZ0h+TkcdjRKa8s7echG0ajoDG/HSyrdL1nprtOkP3Q8RPdiUY5UJpfH8nXOOEG3wcojutITGH9c4hG5j8Q65sNJuhhOyAbf7wiUchYJz/DQ6w03XlyEiN7EwRMMk635yQVK+hISD/NZk1+nt9zhfcBrEN+yq9Q13bAbTNsRuBQ6S+uZDKDMxgyM+bTRnChcMwRGPVYi0je2HrRhRIgYnTw7NjeIafQnG/zg9a680x5lNpkQU2os1Rxi2/H8xg8yJidsL4bNNKKl/h9Cq9m8C4m/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFo8DtiF1KbBUg/jkjUoXwFMvnQOjThRwG9GaA9Wz6U=;
 b=EmYpfzAk89S6W2+ERBBlcYYxxPlQ7bc5JFy9iFYoqP0pG6Nmdf8773DtIE9AooEYCkQ09hpcpw0WS5qt8OCq1wGP2E6XP+a3BkGktX0hJB6qESQ1AmHe5K4uRAQCrQRzzMN/xvP+ovyqFGXoCaXvSbJbp8WmMhYjBZT+tn7bxJQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6)
 by PR3PR08MB5804.eurprd08.prod.outlook.com (2603:10a6:102:83::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 10 Nov
 2020 13:41:58 +0000
Received: from PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::9459:9333:f2d7:c027]) by PR3PR08MB5785.eurprd08.prod.outlook.com
 ([fe80::9459:9333:f2d7:c027%7]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 13:41:58 +0000
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH] arm-autonomy/arm-autonomy-host-image-minimal: Resolve guest path if symlink
Date: Tue, 10 Nov 2020 13:41:52 +0000
Message-Id: <20201110134152.14805-1-Nathan.Dunne@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To PR3PR08MB5785.eurprd08.prod.outlook.com
 (2603:10a6:102:89::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-natdun02.stack04.eu02.mi.arm.com (217.140.106.54) by LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:76::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 13:41:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 57fa6ba0-a35b-4671-61d2-08d8857e6a51
X-MS-TrafficTypeDiagnostic: PR3PR08MB5804:|DB7PR08MB3449:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB34492E40C3B949C46569DD0C8DE90@DB7PR08MB3449.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oLkbSzmVlIMLssH3LibEEVc8tKqjJvT/5v+CQrf1NSJVw4KniH4LcwFcubyDvEGIrZpMGOxhMVYNxm9ySqR7f81Tw/9tJpu42PTM7loJwEU8qcTKtJJaoY8fUNgR13PAPB4xCGrCC27U2FDe2sLrnuKWZ8bfra8k0ZnbypE3YN/5UQDTdte8AkHqe68XkewE9OUx8AwaVx0d2lIgDwqy0Etlg3YTFmzHLGmZoc6LOSnMgIkm6ie+NQgzFqmiPIdJrvb1uhYm85EH08FCKZHERjXmDrSeTpCF4n9+gC+RmP4ntwnbmUPxaGwIfCS48Sxcr5lQbOLpZHSnwdTP1Or74g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5785.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(36756003)(8936002)(86362001)(2906002)(2616005)(8676002)(1076003)(83380400001)(956004)(7696005)(52116002)(316002)(6486002)(4326008)(16526019)(478600001)(5660300002)(186003)(26005)(6916009)(66476007)(6666004)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 XUVAp6Jj6g3fQQ9F9gjeK53YFhtREVoi7add9I+ExZqTlu+N9h1O14h+s1uKntGAFNN4K1rF/Im35Rxj8dY6VaWDeB/WmWPE/Y2E0gemdv2LIRPC9cbpoDl1l/bnPLlKDXR9qBnTwbE7X/MWk2f8/kfp+n0pJNXQYo9iTM1iGQDBh0VBc8RvcBAWB2rwEOb8RV4x+68TzcoizKCvfpH/+y2JyWBCrAVFmQizHx3h0p7YFhus698LMd5ZTZ9iMgC+jFTNVgvjId+sNLUU5JmCuQR98yEfc7HnXQGc/dblTxM2yYXxA9iE2nSOfdsfxl8OfUNQWrpomquGrK0BoxjoPukY33DE3Zb2x4UFkLI6ye9TiIS+rgDAkKLlfeIdFR1/nKYwiEkZBm1waXkbcDJLKd4mhctTf+yKibMVDJ1RdwYp1Cm3m828QyEWR5aX3IAsvmJV+qLqa04/eGLSO+fPClaYQi3L594WOYuBwB4R5+hYoHTCowBJhW+7uyGr2jGkIfaym37NEZaBJRrK9vbrfLPGNqWBoMrT3lZvCEHnYl9pgJ5Y9zZMSiRMcddZneUuXDLRCIl8mlVQYxmspTDgyha70FxKiru+9jjUbj+79ykQKyV+3HNoBSlV/fzxvhGbR/tjnmY36M0cubQeeL5kXg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5804
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Nathan.Dunne@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3c138dc0-c860-443a-5009-08d8857e6523
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1fbXqfkrydLZnYUzwN7CTe6IQjzCnRkw37oTPnJN6hXw+ZUPDTCyOwvRWk9n263/l/vGkKIWjAmDDwVae5i1dmadeV3Goyyd7NcZMM4cVxjnvPkrsK9Fui1RzyqefXlgzxKpEbDyDofwakhqxpjG5dfaPUmezHQ1HS4uCR1O4a6ScA0/fp1F2m9Bp798QP9G2q0o9ir9fRwH/m3rylBQl4MbaDyicfrY75A7JCIq37h4w6Z0A5aKKgXchsZtE+aFiYAlTooCR4bNDs3bL8aBxo7eEsh6ijTlIjgNCk1swmrSFoW8ZDy9mbUQWwzo74L9v2navVEBwHh8xMNWvfXeQuEqiOpiD7VX7PWLnmB0I9CWYWjFb+CzIDibkpsjpGLpZEIuuFvw13D5AC+ZBo1NIw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(478600001)(26005)(81166007)(316002)(70206006)(36906005)(6486002)(4326008)(36756003)(16526019)(8936002)(186003)(5660300002)(6916009)(956004)(336012)(2906002)(82310400003)(8676002)(2616005)(86362001)(6666004)(1076003)(70586007)(356005)(83380400001)(7696005)(82740400003)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 13:42:06.8387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fa6ba0-a35b-4671-61d2-08d8857e6a51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3449
Content-Type: text/plain

In ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS, remove fatal error if guest path
is a symlink, and instead resolve using os.path.realpath.

Issue-Id: SCM-638
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Ic4fdd7ae03ed6bb6caa55e722b89114080c90f4c
---
 .../images/arm-autonomy-host-image-minimal.bb            | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 188e31d..47a07cd 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -106,7 +106,14 @@ python add_extern_guests () {
         _, _, path, _, _, parm = bb.fetch.decodeurl(entry)
         if 'guestname' in parm:
             if os.path.islink(path):
-                bb.fatal("Guest file is a symlink: " + path)
+                realpath = os.path.realpath(path)
+
+                if not os.path.exists(realpath):
+                    bb.fatal("ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS link does not resolve: " + path)
+
+                bb.note("Guest file is a symlink:\n " + path + "\nResolved to:\n " + realpath)
+                path = realpath
+
             bb.utils.mkdirhier(guestdir)
             dstname = parm['guestname']
             # Add file extension if not there
-- 
2.17.1

