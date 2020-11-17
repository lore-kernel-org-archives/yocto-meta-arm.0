Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.43])
 by mx.groups.io with SMTP id smtpd.web11.6015.1605608001062917453
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 02:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EKZ4BLz9;
 spf=pass (domain: arm.com, ip: 40.107.3.43, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnCKZWyRQoV6qFHYamIQJy3FAxaFhmWc88vBwPgPLNQ=;
 b=EKZ4BLz9SGUz9WT4XPYxH11WNVC25iHUC25UfewiC6xtaaxyqzPVpZQ2vvwUlkPxN3kL1KZxaWk6+WmqZCECwj/H8bTBwxi8w5iIBdUd12GdphI5z8p6qS8bM2UhJnemsB0VcmTFeJiicy5MOlzK5bNzOEidHiiwy/zXcEG1Wpo=
Received: from AM5PR1001CA0059.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::36) by AM6PR08MB3527.eurprd08.prod.outlook.com
 (2603:10a6:20b:41::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:13:18 +0000
Received: from VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::9a) by AM5PR1001CA0059.outlook.office365.com
 (2603:10a6:206:15::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend
 Transport; Tue, 17 Nov 2020 10:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT027.mail.protection.outlook.com (10.152.18.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 10:13:18 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71"); Tue, 17 Nov 2020 10:13:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 437a77a929ec2670
X-CR-MTA-TID: 64aa7808
Received: from d819ff197cac.4
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 92CF36A7-D924-426D-9F75-A6F668417BF5.1;
	Tue, 17 Nov 2020 10:12:39 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d819ff197cac.4
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 10:12:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbARhNc+dULAsqign/uqCNtHsbnytNjMp0NwjTmgIYLWhx29oZS5+KA9uk1KgR6+SkYikuPzF9wkH0xU3xa+n2u4b5K4gCTldwBytRboPrmdgjwZHLgS+mzmhXYBlEWLYjJQyEAB9EfX0S9QyUeYJ1+preCz5i1UTKUEa7S5m/HMFkn2TP1UTM2x9SmSAdRmuxypAAOCc5oC1V6Civ8hqy8ADc1EG9qGUseNA5xJdf+lbNiSMEkxoeOjzrXgz8KVlJYPyeufT6BrUQNFtpIuJmZFgkYVE8P7TMQ35D+tKEs0zleoeQfVhBmmI9qoVLuuoGrIJP21MxiO89PeZPCF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnCKZWyRQoV6qFHYamIQJy3FAxaFhmWc88vBwPgPLNQ=;
 b=cn33GKxw8cRkjyifpOrBsUvQc5fUT/P5wVnl/u/9o5cWGc6s7zHGniYPrYJMPuQjPrmr/L1UIwYSZqSvEjdAslQjTwIhUhWFXLVOEUg4umyK1HRxUkYPAwJ54DYYSGQ/ObcJ64mnUXWGRzjZYPtL1gh89yJVZNGkSv8FFTPatlQhMlK3seJLem5nhQw/Xmvu7hGXH2UGpbB3XEuQl8fUP/ZijUDFz7n2bvPrcv4NA+zpTKYxk1An4UZaWYy6JhgJJp69nPDIXEp3gIq2Wppcu4n2J/BmyLfuySlMlAF0fM6wcDvgD1NLwWxpMA9p37cNp6THwOgPDzTc8hUlPkIzTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnCKZWyRQoV6qFHYamIQJy3FAxaFhmWc88vBwPgPLNQ=;
 b=EKZ4BLz9SGUz9WT4XPYxH11WNVC25iHUC25UfewiC6xtaaxyqzPVpZQ2vvwUlkPxN3kL1KZxaWk6+WmqZCECwj/H8bTBwxi8w5iIBdUd12GdphI5z8p6qS8bM2UhJnemsB0VcmTFeJiicy5MOlzK5bNzOEidHiiwy/zXcEG1Wpo=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6213.eurprd08.prod.outlook.com (2603:10a6:20b:23d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:12:36 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 10:12:36 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 7/8] arm-autonomy/init: Change execution order between modutils.sh and checkroot.sh
Date: Tue, 17 Nov 2020 10:04:48 +0000
Message-Id: <20201117100449.20111-8-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117100449.20111-1-diego.sueiro@arm.com>
References: <20201117100449.20111-1-diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 10:12:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2a900869-dc22-41af-807e-08d88ae16789
X-MS-TrafficTypeDiagnostic: AS8PR08MB6213:|AM6PR08MB3527:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB35279D1B5C2A0324EA7C712D92E20@AM6PR08MB3527.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZMbC2zLPvNNiESgUZ+raea6+gPk+vIquiugWcrh+nprEjWDfLfc8A7gTQgHXIQ/3iFWFEEiMhTNP5WeFnkuO9UgbnMGFC+HTRINYjOvje5WJNoSF/sWjfjbxGRY86a0de3LosaMDH53IOydjEjC6ohYBC5mzLUg43juFu6G+Uyr7XdF2mLP+yVRJqHhV1FNwFFr7FMElFaKJMCg0hFBYKY2H6qAdhwQMRem+xXBkeD11mgw8g9k+djdr3oj2+njuPBA64OWuFbClrBi/BFvLneJNmee9AWyZVml24y0h/obChNWOI8xAxB8i5vb7Bnny/Ay2y9Gebl1+LHn1vLIUZw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(478600001)(956004)(36756003)(2906002)(1076003)(8936002)(44832011)(6666004)(2616005)(8676002)(83380400001)(86362001)(186003)(16526019)(4326008)(7696005)(26005)(316002)(52116002)(6486002)(5660300002)(66476007)(66556008)(66946007)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 Jblj1rStUpqF5nuF8KBpSJ+iKe7GUD/1ELrOViDiBaqzfJob+D1KCF7croDtjYzOrjOT8xC4Q5YDQuD3CyfZ53wTxFQNj5rh+qAZM6A3YzL0Vli3u2JxcHaLo9A7bx0xrR1p08z/m0S1TqTdNPp6qSGrwk3v4zAmBWGJrMQ/vxUQILVpu4AKd6ZzXLHhrVWYGq/UNH14HNYdU0wZZV3Bv4ly0LjPtCvs3iU1v+XTESplMQkM6MYI+clxR/YASkYnpmzW513HLdUL40RrFeZ4ulk58PlZx+eeSkI6QLYbZaZzrdr0RWo7Xhz/BCixZ9UgbGiJAsMmjzaltTwPfFwr7r/Kl8bQTAoAwyk0dI4A4XdAP2BsH5GaFM6uqMFbpK3llLFc7HbiDydgeJmErhpbP3vVQkaL0rrFD/76l+vf3NGDBOym8qdD6tKljFwcAlpor0Hp+u/SQ7FVUcR+jRWl/EzVyz0IEtYjeL65NZkSgukGIGn+0Xf4toeLScmxtSUxbx+mXJ3RTlUPV8xWkBExNsA+0fC/NjZEjq+n8zLe6pSQoJBQ2rRUaw1kNqBNDxBYQzyK7GXsnAxZ/0nglgrYszskNtMR/Jt80eW1SdZ9t4u0jxyo8XFR64Egg0Dhu8/455y7eZa/PtUcBihiV6VBr8G8J0e1tDOvLfJNpH/ymU/icMClXiVPSny8+525ZFSo3sxJW5neMy1S0JPoC0YeH5LULi1TNqIcRH+U6m/yTiVIJPrx64dQqnBmdXeLRQpyPV1fLQzx2j8iZxS+p4nXIewq1hkzCwUiJOrwtwUxx4wO2xgdxHlVZbAjqCjsUAuJuYxiGt1lLW2LjZrfDtJvWdT5cnFP5N3NS5zDz5rXHZWNX9zb1m/cVTq0Rsx7zgU2f0yfh85OwXjDRIyvxQgI7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6213
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a66204ac-a967-4868-046c-08d88ae14e93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FMPcQJA3YhVnbbO44x8z51SrUQ0D1hilYCdxQe+BaZ/L5SjJ7w0V9xuQ2vNFK44N6y6xGn00+lFbFGGitefW0Rz6Rc4mmERnIappASm4Z5VjhI3JiC5vm0lMHJusIYFh07140Aiw1jfcE7jmoEYf3WHrb+ypOdocoUv4oGpJnQYNu5nbuneXWjZH+VHx0JhkQ/XuwexruOdDy2zIYepo5NG5gjBl31T17/BVOXun/0j1fXT9rtKv0fRO9E2abN/dvAPxiciqiDQo8UOevxoK5X4J19naJ6BqMWCgRBs4ilU5BbCEcv1WjBBX3xKXOCTENDz9icjf0I6TNegSw3YtpU5oAZfT6JjpMoUHGHb/lzbidMRosaaH/FHsSrPzo0xJI50BXqOMYHhBFMO7zGlpgw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966005)(2616005)(956004)(83380400001)(186003)(6666004)(478600001)(47076004)(16526019)(26005)(7696005)(336012)(36906005)(316002)(8676002)(6916009)(82310400003)(8936002)(356005)(2906002)(5660300002)(1076003)(36756003)(70586007)(70206006)(82740400003)(4326008)(81166007)(6486002)(86362001)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:13:18.0835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a900869-dc22-41af-807e-08d88ae16789
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3527
Content-Type: text/plain

When '/' is first mounted as read-only, we want to have the checkroot.sh
initscript (which then remounts '/' as rw if allowed) running before the
modutils.sh.
This is because modutils.sh initscript might need to run depmod depending on
the status of the modules.dep file to update it and the '/' needs to be
writable.

Change-Id: Idac9aa19fba6b6bf46532097a667ce0518af515c
Issue-Id: SCM-1654
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-core/initscripts/initscripts_1.0.bbappend        | 5 +++++
 .../modutils-initscripts/modutils-initscripts.bbappend       | 2 ++
 2 files changed, 7 insertions(+)
 create mode 100644 meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend
 create mode 100644 meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend

diff --git a/meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend b/meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend
new file mode 100644
index 0000000..5fb2197
--- /dev/null
+++ b/meta-arm-autonomy/recipes-core/initscripts/initscripts_1.0.bbappend
@@ -0,0 +1,5 @@
+do_install_append() {
+    # We want to have checkroot.sh running before modutils.sh (06)
+    update-rc.d -r ${D} -f checkroot.sh remove
+    update-rc.d -r ${D} checkroot.sh start 05 S .
+}
diff --git a/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
new file mode 100644
index 0000000..2a2fd20
--- /dev/null
+++ b/meta-arm-autonomy/recipes-kernel/modutils-initscripts/modutils-initscripts.bbappend
@@ -0,0 +1,2 @@
+# We want to have modutils.sh running after checkroot.sh (05)
+INITSCRIPT_PARAMS = "start 06 S ."
-- 
2.17.1

