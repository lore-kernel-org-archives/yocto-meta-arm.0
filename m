Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.48])
 by mx.groups.io with SMTP id smtpd.web10.6167.1608119136212304813
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Dec 2020 03:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NgE8rJpB;
 spf=pass (domain: arm.com, ip: 40.107.7.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3rH/cWRyAkJqh7LFe2DtKyxBxYbQpFKJJ7LwdEFJi4=;
 b=NgE8rJpBIXsmKft14h+XmdBEsVzigkCBD22GgSp52LBxlzgpLHDC28z7WApUBfqBuI7ox8G3JSIisMxMmyVv5Dy9MV1uGZ7RIGl7OfjOFPOyyYhAaqf3sgqRWPZ+GHV6Q97HLpIrma08qtcMHN15DFTWtlpx7ut2zbFIhygBTNE=
Received: from DB6PR1001CA0040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::26)
 by AS8PR08MB6135.eurprd08.prod.outlook.com (2603:10a6:20b:29f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 16 Dec
 2020 11:45:33 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::3) by DB6PR1001CA0040.outlook.office365.com
 (2603:10a6:4:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 11:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.22 via Frontend Transport; Wed, 16 Dec 2020 11:45:32 +0000
Received: ("Tessian outbound 39646a0fd094:v71"); Wed, 16 Dec 2020 11:45:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8ad1b858b146f0b
X-CR-MTA-TID: 64aa7808
Received: from 1345dfd2a442.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F5C7FAD7-4ED7-4542-9DE3-2ADDCC9C4EDB.1;
	Wed, 16 Dec 2020 11:45:16 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1345dfd2a442.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 16 Dec 2020 11:45:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvlHWo5FFhd6S07oSzoNNluJm+NCC4OG9+FADn2EtRF7fzTVZiiWPFzwYUG18y0zvzG+YbmP9MvX1hjrrX7Rywnx3V2es0EPHtfuUA1IohVoZPTtBsvgxBQIXKD21dsQsCv7sHJzbvqRTxTrgXXRJm2MbKUl0GMNo823OdB3aweHXUSXrbvxDiC5hNuhDnyyfTCg3VeOl+RpaCLGd+Pf0sqRnNlVnvTS9gZGZidS5utxo1yfLWwx5d4Sp4MOuvRRDLRI8os4SWlzPF6M+Rudr/+CYuHOgjx7L4oHlm2Qzfg7T3gLDF5ZjmOAWp1zszdEOEz+If/375/6t/mKhyKf3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3rH/cWRyAkJqh7LFe2DtKyxBxYbQpFKJJ7LwdEFJi4=;
 b=D8CNQijuLKYh/ubUrEdBZhAyiH7GL+jj7gUOd1QJsU21iNUDTaKY5EoGCgUZpuAw+1InDBQ75XSLhe/G/cX7yrUOJ8Dyj4I4VniIftRIWkKv4lkhOcFscKTVISYF1D53ghw46fhi3To8tzBFQGQ/Z4n3dpNPYaZ6uKFgItj2oQWW+7+/oDqY2CM2vTKLCdrznEmaINFE/CAL8iP96nU2XkLqHoifaKMVbt4LNAe4TCwTm7q4Ie9tMlZ4s36+FIedZIHEkfbW70obLRejU5Vrii8U3apinB8GuoZyIGApVTpg3KtchFdkaAL6WsJ4YbYOMLhe7P3cP7yve1BPwc9ElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3rH/cWRyAkJqh7LFe2DtKyxBxYbQpFKJJ7LwdEFJi4=;
 b=NgE8rJpBIXsmKft14h+XmdBEsVzigkCBD22GgSp52LBxlzgpLHDC28z7WApUBfqBuI7ox8G3JSIisMxMmyVv5Dy9MV1uGZ7RIGl7OfjOFPOyyYhAaqf3sgqRWPZ+GHV6Q97HLpIrma08qtcMHN15DFTWtlpx7ut2zbFIhygBTNE=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM7PR08MB5320.eurprd08.prod.outlook.com (2603:10a6:20b:103::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Wed, 16 Dec
 2020 11:45:13 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%5]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 11:45:13 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-autonomy/xenguest-manager: improved logging
Date: Wed, 16 Dec 2020 11:45:07 +0000
Message-Id: <60e9b20c917014eda34f15d6d0437f8abe9625a7.1608119034.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.55]
X-ClientProxiedBy: LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::21) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.55) by LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:152::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 11:45:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bcfc45d6-0191-4e51-55e1-08d8a1b8186b
X-MS-TrafficTypeDiagnostic: AM7PR08MB5320:|AS8PR08MB6135:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB61359CCFD7CF73395B1A3B8992C50@AS8PR08MB6135.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HOAVyEFZL7PVt3qTKiU7+alVxa8h3IZTGKzXXReVedKdrtSTJnHrU7QqpMv8GND8OWIEJvAr59mkf+2Vy/iBbOKNBjn+u05q+bZaJEJnRpw8vpT9g9T2yM5f47NIYa+acxxNMvp60D7y8hr9baeCnr8SxCoDour7to6oQ68jN91vIlwrs4iNotDZiI4huHRNrEwHI4K2PcBQ8v0Z4LKz53qSHq54h8hAI8ZToBDCn300bdXD2iI8SNB6DL54C1aECvhO7Kn7sQcDs1LhPfQAymecrsOwc2PBtpL/O31Wl/MQ5pPtzSkCXhQxFRwniHkqKVIRsutoQkltl4ZJziXfvQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(30864003)(316002)(66476007)(6486002)(6916009)(6666004)(66556008)(16526019)(36756003)(26005)(52116002)(44832011)(956004)(2616005)(83380400001)(5660300002)(186003)(478600001)(7696005)(4326008)(2906002)(8676002)(8936002)(86362001)(66946007)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?4u+JL7wzLE8/WwIxVugRp0ASNIO0G1ZJHJ4/+SaGBRQA8yGbUP2nFsZx0Ocb?=
 =?us-ascii?Q?FWqpCqGYyoKhuMgPuelMNwPf4G1E4CsjEPeIv/6kXPzzpFXu40j8p62Xovk1?=
 =?us-ascii?Q?/Au0eRdrF8lEcy9Ui0pxq7XtPQyT4f1oR0F0DJkMFxuUfB5IlYVamgvFPl2w?=
 =?us-ascii?Q?lZpIaYuXfdaYJL0Rx5TQp9TWHXQlQ2v3zOkWjk8p3l46+i1ZzQ1mjmtUP2cA?=
 =?us-ascii?Q?JytgKxRA0YkSnqHcgQW0V0iIO1zWAOklv1OBEZtunTDeQudu9/6bQKJVzVls?=
 =?us-ascii?Q?Z2XEIS+ikDOFeharrGbiVwu5ic7lkVz+iiSJCQBXrDdvfNvQXa4P0kWFIdhN?=
 =?us-ascii?Q?blo6jfOe+Wmlah+NdsNbGcwxqxKKTTNrdQP/11cKT8x2kQavQ9t5kWtGubUr?=
 =?us-ascii?Q?ZQ6lzMhpVZDlDqttOBTPq7+t+OhnKY4TXwGQC2hWZLLNiBXlUVWlDUFZlb+a?=
 =?us-ascii?Q?R9Fbr9Dsb9mLa6iNjCx2NExqCUradbtT9NvZghQlRvJluxHtvp8Gu0mgkFnL?=
 =?us-ascii?Q?Mr4RQ6qvAAOYeHQnanMAimoYfk5f5Md4fUJ2smlnqGscoqXEn2uJ9rrdIgF6?=
 =?us-ascii?Q?nRHDF1ct3BFw0yrxWEhB+hB+rEBVANSnkdPT1pPgDqTL2jYQM82YFVPgeWfy?=
 =?us-ascii?Q?sUH7sbLTB8i7GCsncDSyqEFzE5XyguDZAbXtEvFJTKJvRpZl6DClxuVuaC8Q?=
 =?us-ascii?Q?asZEO4P4JHm/zkuWX8WDweoHbMvhBXJuOx5EP5TEvJ+S71dvSwGTO7d9NezK?=
 =?us-ascii?Q?QJ5NO4D92mvROOHNve2e4GhEzOz1JluIrZ4O2ozWOh1IZV/ZvceLnvw6mJYw?=
 =?us-ascii?Q?ga/x0YeS4VWF1ivRE6J7CAcg749SDbHmjboitnWqZT3w0YxlKFaU1EbKZgg9?=
 =?us-ascii?Q?dc+SZz8NjxhVaOT7JvZOpiwho3VRImyZJ/rDLPSGHWc4kALWj4Va80hiEPS+?=
 =?us-ascii?Q?CaU6SHxVg9u+rChzJ1B4SvobmdrFi21cK5+eGRycpFYtducr5pnbqUq8msl4?=
 =?us-ascii?Q?pGPf?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5320
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d8cb3426-4866-4338-55e0-08d8a1b80d0a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nAqntq0EzGvDk4U5/6XSNo5DnjWzvmc9HV5dUdEyMBr4xzx1HmAMAK0OFNo9tCkMVGH8sD9lk8pRSZIDhnRoxYKZhazFy3i2IHK9cV5knAXSQOKcAQF0E2iZrHqRbWuuRvmASQiQpUb3k+YzmrvcLriLHdNZFW7jfq4Pu/7zBu+G9pk2+qprZLf6Z7U1fu1+DxJQq8atW7Q7a9+QFeT4BbFYx/E8xgtZF30wb04jM6GqW5eZe9u26wF/dPjYjtzksJdtl6XFi0UnyhiAy0U9mAu687v2S0KAgkG68ycX5KTh4NL9xlpAISGdENdyCuNBXl3cA2v7qUTrSlR1TY4qYOkeMvpDRYu8FXioFFvlVHYR1Ph8vVGS292dJL/1ghKUDW+THcFnovHcJqZwDS33Nw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(186003)(2906002)(956004)(30864003)(5660300002)(478600001)(26005)(83380400001)(4326008)(8936002)(16526019)(70586007)(336012)(81166007)(6666004)(47076004)(70206006)(6916009)(6486002)(356005)(86362001)(7696005)(82310400003)(316002)(36756003)(8676002)(2616005)(44832011)(82740400003)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 11:45:32.8597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfc45d6-0191-4e51-55e1-08d8a1b8186b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6135
Content-Type: text/plain

From: Nathan Dunne <Nathan.Dunne@arm.com>

Introduced logging functions to unite logging to the console and to
the logfile with different filterable log levels. Also introduced
logrotate to ensure the size of the log does not become excessive.

The Log levels introduced are:
ERROR INFO VERBOSE

By default, both the terminal and the logfile will receive ERROR logs.
More verbose logs can be written to the logfile in two ways:
- passing the parameter "-v" or "-vv" to write info and verbose respectively
- modifying the value of "XENGUEST_MANAGER_LOG_LEVEL" in the host conf file,
  or updating the entry it creates in the config file
  /etc/xenguest/xenguest-manager.conf

The order of precedence is as listed above

Issue-Id: SCM-1516
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I47f74802ed31a5bff12305eab707e009af7e5398
---
 .../documentation/xenguest-manager.md         |  39 +-
 .../xenguest/files/logrotate-xenguest         |   6 +
 .../xenguest/files/network-bridge.sh.in       |   4 +-
 .../xenguest/files/xenguest-manager           | 587 ++++++++++++------
 .../files/xenguest-network-init-post.sh       |   9 +-
 .../xenguest/xenguest-manager.bb              |   9 +-
 6 files changed, 435 insertions(+), 219 deletions(-)
 create mode 100644 meta-arm-autonomy/recipes-extended/xenguest/files/logrotate-xenguest

diff --git a/meta-arm-autonomy/documentation/xenguest-manager.md b/meta-arm-autonomy/documentation/xenguest-manager.md
index 5a66e8a..11df2a1 100644
--- a/meta-arm-autonomy/documentation/xenguest-manager.md
+++ b/meta-arm-autonomy/documentation/xenguest-manager.md
@@ -23,7 +23,7 @@ Usage
 -----
 
 xenguest-manager must be called like this:
-`xenguest-manager OPERATION [OPTIONS]`
+`xenguest-manager [-v(v)] OPERATION [OPTIONS]`
 The following operations are available:
 - create XENGUEST_IMAGE [GUESTNAME]: create a guest from a xenguest image file
   as guest GUESTNAME. If GUESTNAME is not given the image file name is used
@@ -37,6 +37,9 @@ The following operations are available:
 - status [GUESTNAME]: print the current status of GUESTNAME. If GUESTNAME is
   not given, print the status of all guests.
 
+Passing -v or -vv will increase the logging written to the logfile.
+The terminal will always show only error messages, regardless of the logfile.
+
 For a detailed help on available options please use:
 `xenguest-manager --help`
 
@@ -65,6 +68,13 @@ The following parameters are available:
   name).
   This is set by default to "/usr/share/guests".
 
+- XENGUEST_MANAGER_LOG_LEVEL: Set the default log level for xenguest manager. Must
+  be one of ERROR, INFO, VERBOSE (default: ERROR). The extra will be
+  written to /var/log/xenguest.
+
+  If a verbosity argument (-v or -vv) is passed to xenguest-manager directly, it
+  will override the setting in xenguest-manager.conf
+
 Init scripts
 ------------
 
@@ -80,7 +90,7 @@ directory on the target:
 
 Inside the directory, scripts will be executed in alphabetical order.
 
-Since these scripts are sourced by xenguest-manager they can acccess functions
+Since these scripts are sourced by xenguest-manager, they can acccess functions
 and variables from the parent file's scope, including:
 
 - ${guestname}    : The name of the guest being created
@@ -89,11 +99,30 @@ and variables from the parent file's scope, including:
 
 - ${guestcfgfile} : The name of the config file for the starting guest
 
-- ${LOGFILE}      : The file to append any logging to, e.g.
-                     echo "Hello, World" >> ${LOGFILE}
+- log()           : Used to write a log to the logfile, default level INFO.
+                    Takes an optional log level and a message body
+                    e.g. log ERROR "blah"
 
-Sourcing also allows the script to access params.cfg.
+                    Options for log level: ERROR, INFO, VERBOSE, and FATAL, which
+                    will call exit 1 immediately after logging the message
+
+- log_command()   : Used to call a shell command and log that it has been
+                    called, as well as capturing both stdout and stderr.
 
+                    By default the command output is dumped to the logfile as an error
+                    if the command returns a status > 0, or as a verbose message if the
+                    whole script is running in verbose mode. An optional log level can
+                    be passed to alter the level the log should be if the command returns
+                    a status >0,
+                    e.g. log_command INFO "ls -lh ~"
+
+                    Options for log level: ERROR, INFO, and VERBOSE
+
+Attempting to call any other functions from xenguest_manager in an init script may
+result in a fatal error, from which cleanup is not guarenteed.
+
+
+Sourcing also allows the script to access params.cfg.
 
 An example of how to create the directory and install an init shell script can
 be found in:
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/logrotate-xenguest b/meta-arm-autonomy/recipes-extended/xenguest/files/logrotate-xenguest
new file mode 100644
index 0000000..fefc347
--- /dev/null
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/logrotate-xenguest
@@ -0,0 +1,6 @@
+/var/log/xenguest {
+    missingok
+    size 10k
+    copytruncate
+    rotate 2
+}
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
index 967c245..3f87b76 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
@@ -11,11 +11,13 @@ BRIDGE_NAME="###BRIDGE_NAME###"
 case "${XENGUEST_NETWORK_TYPE:=}" in
     nat)
         echo "vif = ['script=vif-nat']" >> ${guestcfgfile}
+        log info "Network type is NAT"
         ;;
     bridge)
         echo "vif = ['script=vif-bridge,bridge=${BRIDGE_NAME}']" >> ${guestcfgfile}
+        log info "Network type is bridge: ${BRIDGE_NAME}"
         ;;
     *)
-        echo "${@}: XENGUEST_NETWORK_TYPE=$XENGUEST_NETWORK_TYPE invalid"
+        log error "XENGUEST_NETWORK_TYPE=$XENGUEST_NETWORK_TYPE invalid"
         ;;
 esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index 9acbca0..b90cc73 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -7,21 +7,179 @@ this="$0"
 XENGUEST_CONF_BASE="/etc/xenguest"
 LOGFILE="/var/log/xenguest"
 
+# Valid values for log level
+LOG_LEVEL_VALID="FATAL ERROR INFO VERBOSE"
+
+# Log levels being written to logfile
+LOG_LEVEL_LIST="ERROR INFO VERBOSE"
+# Affected by -v(v) param and conf file
+
+# Log levels being written to terminal
+VERBOSE_LOG_LEVEL="ERROR"
+# Constant
+
+# Highest Log Level: Default is ERROR only
+LOG_LEVEL="ERROR"
+# Used to update LOG_LEVEL_LIST
+
+
+# This should only be called from either log() or log_command.
+# It expectd $loglevel and $text to already be in scope
+function log_to_file ()
+{
+    if [[ ${LOG_LEVEL_LIST} = *${loglevel}* ]]; then
+        tstamp="$(date +"%d-%m-%Y %T")"
+        tag="[${loglevel}]"
+
+        printf "%s %-9s %s\n" "$tstamp" "$tag" "$text" >> ${LOGFILE}
+    fi
+}
+
+# Write a log to the logfile, and to the console
+# Messages are written to the log with the date and a timestamp
+function log ()
+{
+    # Inputs:
+    # $1 - optional level to log at, one of ${LOG_LEVEL_VALID}
+    #      Default: INFO
+    # $@ - log message body
+
+    # get loglevel from parameter and capitalise
+    loglevel=${1^^}
+
+    # If no loglevel is passed use INFO
+    if [[ ${LOG_LEVEL_VALID} = *${loglevel:-INVALID}* ]]; then
+        shift
+    else
+        loglevel="INFO"
+    fi
+
+    # Kill script immediately after a fatal log
+    killscript=0
+    if [ "FATAL" = ${loglevel} ]; then
+        killscript=1
+        # Log at error level for the user
+        loglevel="ERROR"
+    fi
+
+    text="$*"
+    log_to_file
+
+    # Write to terminal if level is high enough
+    if [[ ${VERBOSE_LOG_LEVEL} = *${loglevel}* ]]; then
+        echo "${loglevel}: ${text}"
+    fi
+
+    # if Log was fatal, kill the script
+    if [[ ${killscript} = 1 ]]; then
+        exit 1
+    fi
+}
+
+# Write a shell command to the log and execute it
+# The stdout and stderr output of the command is captured in a variable,
+# and written to the logfile in two cases:
+#  1. The script is in verbose mode
+#  2. The command returns a non-zero status AND
+#     The loglevel parameter (default: ERROR) is in $LOG_LEVEL_LIST
+#
+# This means by default a non-zero status results in a log tagged [ERROR],
+# but if a command is expected to fail, the tag can be reduced for visual
+# clarity
+log_command ()
+{
+    # Inputs:
+    # $1 - optional level to write errors at, one of ${LOG_LEVEL_VALID}
+    #      Default: ERROR
+    # $@ - command to execute
+
+    # get loglevel from parameter and capitalise
+    loglevel=${1^^}
+
+    # If no level passed, log output on failure at ERROR
+    if [[ ${LOG_LEVEL_VALID} = *"${loglevel:-INVALID}"* ]]; then
+        shift
+    else
+        loglevel="ERROR"
+    fi
+
+    # Commands cannot be logged at FATAL.
+    if [ "FATAL" = ${loglevel} ]; then
+        loglevel="ERROR"
+    fi
+    local command="$*"
+    local output=""
+    local status=0
+
+    # Capture stdout and sterr to write to logfile
+    output=$(eval "${command} 2>&1")
+    status=$?
+    # If command failed, or verbose mode, write log
+    if [[ ${status} -ne 0 ]] || [[ ${LOG_LEVEL_LIST} = *VERBOSE* ]]; then
+
+        # if command didn't fail write it at verbose level
+        if [[ ${status} -eq 0 ]]; then
+            loglevel="VERBOSE"
+        fi
+        # otherwise write it at ${loglevel} from arguments
+
+        local append_to="/dev/null"
+        # If we are writing ${loglevel} logs to file, use file as append_to
+        if [[ ${LOG_LEVEL_LIST} = *${loglevel}* ]]; then
+            append_to=${LOGFILE}
+        fi
+
+        # Log that command was called
+        text="> ${command}"
+        log_to_file
+
+        # Write command output to logfile or /dev/null, indent to match rest of logs
+        if [[ -n ${output} ]]; then
+            echo "${output}" | sed 's/^/                              /' >> ${append_to}
+        fi
+        # Log exit status
+        text="< Exited with status ${status}"
+        log_to_file
+    fi
+    # Ensure return status is captured
+    return $status
+}
+
+# Sources a shell script and logs it
+log_source ()
+{
+    local script=${1}
+    log verbose "> source ${script}"
+
+    ( . ${script} )
+
+    status=$?
+    log verbose "< Exited with status ${status}"
+
+    return $status
+}
+
 if [ ! -f ${XENGUEST_CONF_BASE}/xenguest-manager.conf ]; then
-    echo "Cannot find xenguest manager configuration"
-    exit 1
+    log fatal "Cannot find xenguest manager configuration"
 fi
 
 # Following variables must be set in configuration:
 # XENGUEST_VOLUME_DEVICE: device to use for lvm
 # XENGUEST_VOLUME_NAME: lvm volume name to create on device
+# Optionally set:
+# XENGUEST_LOG_LEVEL: the loglevel for terminal and logfile
 source ${XENGUEST_CONF_BASE}/xenguest-manager.conf
 
-PREF="xenguest:"
+# Check that VERBOSE level from config file is valid
+if [[ ${LOG_LEVEL_LIST} = *${XENGUEST_LOG_LEVEL}* ]]; then
+    LOG_LEVEL=${XENGUEST_LOG_LEVEL}
+else
+    log error "Invalid log level '${XENGUEST_LOG_LEVEL}' found in xenguest-manager.conf"
+fi
 
 function usage() {
     cat <<EOF
-Usage $this ACTION [OPTIONS]
+Usage $this [-v(v)] ACTION [OPTIONS]
 
 with ACTION being one of:
  help
@@ -51,6 +209,10 @@ with ACTION being one of:
 
  status
    List guests and their current status (running or stopped)
+
+Passing -v will enable INFO logs, and -vv will enable VERBOSE and INFO logs.
+Both increase what is written to ${LOGFILE},
+rather than the terminal.
 EOF
 }
 
@@ -63,21 +225,21 @@ function check_private()
     # 1 - failure
 
     if [ $BASH_SUBSHELL -ne 0 ]; then
-        echo "Attempted to execute private function ${FUNCNAME[1]} in subshell!"
-        exit 1
+        log fatal "Attempted to execute private function '${FUNCNAME[1]}()' in a subshell!"
     fi
 }
 
+# Public
 is_integer() {
 
     if ! [[ "${1}" =~ ^[0-9]+$ ]]; then
-        >&2 echo "error: invalid number '${1}'"; exit 1
+        log fatal "invalid number '${1}'"
     fi
 }
 
+# Public
 # check size and convert it to MB, e.g '1[G]' => '1000M'
 check_size() {
-
     local disksize="${1}"
 
     [ -n "${disksize}" ] || disksize="invalid"
@@ -106,11 +268,10 @@ check_size() {
             ;;
     esac
 
-    >&2 echo -e "Invalid size format '${1}'" \
-                "\n\tSupported size format is e.g 1000M or 2[G]"
-    exit 1
+    log fatal "Invalid size format '${1}'. Supported size format is e.g 1000M or 2[G]"
 }
 
+# Private
 function xenguest_volume_init()
 {
     # Inputs:
@@ -121,80 +282,79 @@ function xenguest_volume_init()
     # 0 - success
     # 1 - failure
 
-    check_private
-
     local diskdevice
     local volumename
 
     diskdevice="${1}"
     volumename="${2}"
 
+    log info "Attempting to initialise xenguest volume '${volumename}'"
+
+    check_private
+
     if [ -z "${diskdevice}" -o ! -b "${diskdevice}" ]; then
-        echo "${PREF} Invalid volume device in configuration: ${diskdevice}"
+        log error "Invalid volume device in configuration: '${diskdevice}'"
         return 1
     fi
 
     if [ -z "${volumename}" ]; then
-        echo "${PREF} Invalid volume name in configuration: ${volumename}"
+        log error "Invalid volume name in configuration: '${volumename}'"
         return 1
     fi
 
-    pvs "${diskdevice}" > /dev/null 2>&1
+    log_command verbose "pvs ${diskdevice}"
     if [ $? -ne 0 ]; then
         # Check if there is no filesystem in the block device
-        echo "lsblk -n -o FSTYPE ${diskdevice}" >> ${LOGFILE} 2>&1
-        filesystem=$(lsblk -n -o FSTYPE "${diskdevice}" 2>> ${LOGFILE})
+        log verbose "Checking for existing filesystem"
+        filesystem=$(lsblk -n -o FSTYPE ${diskdevice})
         if [[ $? -eq 0 && -z "$filesystem" ]]; then
-            echo "${PREF} Initialize lvm on ${diskdevice}"
-            echo "pvcreate -f ${diskdevice}" >> ${LOGFILE} 2>&1
-            pvcreate -f "${diskdevice}" >> ${LOGFILE} 2>&1
+            log verbose "No filesystem found"
+            log info "Initializing lvm on ${diskdevice}"
+            log_command "pvcreate -f ${diskdevice}"
             if [ $? -ne 0 ]; then
-                echo "${PREF} Error: initialing lvm on " \
-                     "${diskdevice} failed." | tee -a ${LOGFILE}
+                log error "Initialing lvm on ${diskdevice} failed."
                 return 1
             fi
         else
             [ -z "$filesystem" ] || \
-                echo "${PREF} Error: The ${diskdevice} is already " \
-                     "formatted as $filesystem." | tee -a ${LOGFILE}
+                log error "${diskdevice} is already formatted as $filesystem."
             return 1
         fi
     fi
 
-    vgs "${volumename}" > /dev/null 2>&1
+    log_command verbose "vgs ${volumename}"
     if [ $? -ne 0 ]; then
-        echo "${PREF} Create ${volumename} volume"
-        echo "vgcreate ${volumename} ${diskdevice}" \
-            >> ${LOGFILE} 2>&1
-        vgcreate "${volumename}" "${diskdevice}" \
-            >> ${LOGFILE} 2>&1
+        log info "Creating ${volumename} volume"
+        log_command "vgcreate ${volumename} ${diskdevice}"
         if [ $? -ne 0 ]; then
-            echo "${PREF} Error: creating ${volumename} volume " \
-                 "failed."  | tee -a ${LOGFILE}
+            log error "Creating ${volumename} volume failed."
             return 1
         fi
     fi
 
+    log info "xenguest volume '${volumename}' initialised successfully"
+
     return 0
 }
 
+# Private
 # Detach a disk we attached to xen
 function xenguest_detach_disk()
 {
+    log verbose "Attempting to detach partition '${part}'"
+
     check_private
 
-    echo "xl block-detach 0 \$\(xl block-list 0 | " \
-        "grep \"domain/0\" | awk '{print \$1}'\)" \
-            >> ${LOGFILE} 2>&1
-    xl block-detach 0 $(xl block-list 0 | \
-        grep "domain/0" | awk '{print $1}') \
-        >> ${LOGFILE} 2>&1
+    log_command "xl block-detach 0 \$(xl block-list 0 | grep \"domain/0\" | awk '{print \$1}')"
     if [ $? -ne 0 ]; then
-        echo "${PREF} Error detaching partition ${part}"
+        log error "Detaching partition '${part}' failed."
         return 1
     fi
+
+    log verbose "Partition '${part}' detached successfully"
 }
 
+# Private
 function xenguest_disk_init()
 {
     # Inputs:
@@ -206,79 +366,78 @@ function xenguest_disk_init()
     # 1 - failed at guest disk preparation
     # 2 - failed at guest disk creation
 
-    check_private
-
     guestname="$1"
     guestfile="$2"
 
+    log info "Attempting to initialise disk for guest '${guestname}'"
+
+    check_private
+
     source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
     if [ -z "${DISK_DEVICE}" ]; then
+        log info "Using disk device and volume name from xenguest-manager.conf"
         # By default guest is using disk defined inside xenguest-manager.conf
         diskdevice="${XENGUEST_VOLUME_DEVICE}"
         volumename="${XENGUEST_VOLUME_NAME}"
     else
+        log info "Using disk device set in disk.cfg"
         # If guest configuration contains custom disk setting,
         # overwrite default one
         diskdevice="${DISK_DEVICE}"
         volumename="vg-xen-$(basename ${diskdevice})"
     fi
+
+    log verbose "Disk Device = ${diskdevice}"
+    log verbose "Volume Name = ${volumename}"
+
     devname="/dev/${volumename}/${guestname}"
 
     DISK_SIZE=$(check_size "${DISK_SIZE}")
     if [ -z "${DISK_SIZE}" ] || [ "${DISK_SIZE}" = "0M" ]; then
-        echo "${PREF} No disk for ${guestname}"
+        log info "No disk for ${guestname}"
         return
     fi
 
-    echo "${PREF} Create ${guestname} disk."
-
     # Init our volume
     xenguest_volume_init "${diskdevice}" "${volumename}"
     if [ $? -ne 0 ]; then
         return 1
     fi
 
-    echo "${PREF} Create hard drive for ${guestname}." \
-         "This might take a while..."
-
+    log info "Creating hard drive for guest '${guestname}'. This might take a while..."
 
     # Remove volume if it already exist
-    echo "lvs ${volumename}/${guestname}"  >> ${LOGFILE} 2>&1
-    lvs "${volumename}/${guestname}" >> ${LOGFILE} 2>&1
+    log_command verbose "lvs ${volumename}/${guestname}"
     if [ $? -eq 0 ]; then
-        echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
-        lvremove -y "${devname}" >> ${LOGFILE} 2>&1
+        log info "Removing existing volume ${devname}"
+        log_command "lvremove -y ${devname}"
         if [ $? -ne 0 ]; then
-            echo "${PREF} Error removing volume ${guestname}"
+            log error "Removing existing volume ${devname} failed."
             return 1
         fi
     fi
 
     # Create volume
-    echo "lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${volumename}" \
-        >> ${LOGFILE} 2>&1
-    lvcreate -y -L "${DISK_SIZE}" -n "${guestname}" "${volumename}" \
-        >> ${LOGFILE} 2>&1
+    log info "Creating volume '${volumename}/${guestname}'"
+    log_command "lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${volumename}"
     if [ $? -ne 0 ]; then
-        echo "${PREF} Error creating volume ${guestname}"
+        log error "Creating volume '${volumename}/${guestname}' failed."
         return 1
     fi
 
     # Add partition table
-    echo "parted -s ${devname} mklabel msdos" >> ${LOGFILE} 2>&1
-    parted -s "${devname}" mklabel msdos >> ${LOGFILE} 2>&1
+    log verbose "Creating partition table on ${devname}"
+    log_command "parted -s \"${devname}\" mklabel msdos"
     if [ $? -ne 0 ]; then
-        echo "${PREF} Error creating partition table on ${guestname}"
+        log error "Creating partition table on ${devname} failed."
         return 1
     fi
 
     # Setup disk name in xen configuration
-    echo "xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname}" \
-        "--xen-disk=${devname}" >> ${LOGFILE} 2>&1
-    xenguest-mkimage update "${XENGUEST_CONF_BASE}/guests/${guestname}" \
-        "--xen-disk=${devname}" >> ${LOGFILE} 2>&1
+    log verbose "Setting disk name in xen configuration"
+    log_command "xenguest-mkimage update \"${XENGUEST_CONF_BASE}/guests/${guestname}\" --xen-disk=\"${devname}\""
     if [ $? -ne 0 ]; then
-        echo "${PREF} Error setting disk in xen configuration"
+        log error "Setting disk name in xen configuration failed."
         return 1
     fi
 
@@ -328,12 +487,10 @@ function xenguest_disk_init()
             fi
 
             # Create partition
-            echo "parted -s ${devname} unit MB mkpart primary ${partstart}" \
-                "${partend}" >> ${LOGFILE} 2>&1
-            parted -s "${devname}" unit MB mkpart primary "${partstart}" \
-                "${partend}" >> ${LOGFILE} 2>&1
+            log verbose "Adding partition ${part}"
+            log_command "parted -s \"${devname}\" unit MB mkpart primary \"${partstart}\" \"${partend}\""
             if [ $? -ne 0 ]; then
-                echo "${PREF} Error adding partition ${part}"
+                log error "Adding partition ${part} failed."
                 return 1
             fi
 
@@ -341,8 +498,8 @@ function xenguest_disk_init()
             partstart="${partend}"
 
             # Sync to see the created partition
-            echo "sync" >> ${LOGFILE} 2>&1
-            sync >> ${LOGFILE} 2>&1
+            log verbose "Sync created partition"
+            log_command "sync"
 
             # Prepare format command
             if [ -n "${fstype}" ]; then
@@ -354,8 +511,7 @@ function xenguest_disk_init()
                         formatcmd="mkswap"
                         ;;
                     *)
-                        echo "${PREF} partition ${part} of ${guestname}" \
-                            "fstype is invalid: ${fstype}"
+                        log error "Partition ${part} of ${guestname} fstype is invalid '${fstype}'"
                         return 1
                         ;;
                 esac
@@ -364,10 +520,10 @@ function xenguest_disk_init()
             fi
 
             # Attach disk to xen
-            echo "xl block-attach 0 phy:${devname} xvda w" >> ${LOGFILE} 2>&1
-            xl block-attach 0 "phy:${devname}" xvda w >> ${LOGFILE} 2>&1
+            log verbose "Attaching partition ${part}"
+            log_command "xl block-attach 0 \"phy:${devname}\" xvda w"
             if [ $? -ne 0 ]; then
-                echo "${PREF} Error attaching partition ${part}"
+                log error "Attaching partition ${part} failed."
                 return 1
             fi
 
@@ -383,15 +539,17 @@ function xenguest_disk_init()
             done
 
             if [ ! -b /dev/xvda${part} ]; then
-                echo "${PREF} Partition ${part} creation error"
+                log error "Partition ${part} creation failed."
                 return 2
             fi
 
+            log verbose "/dev/xvda${part} created"
+
             if [ -n "${formatcmd}" ]; then
-                echo "${formatcmd} /dev/xvda${part}" >> ${LOGFILE} 2>&1
-                ${formatcmd} /dev/xvda${part}
+                log info "Creating filesystem for partition '${part}'"
+                log_command "${formatcmd} /dev/xvda${part}"
                 if [ $? -ne 0 ]; then
-                    echo "${PREF} Cannot create partition ${part} FS"
+                    log error "Creating filesystem for partition '${part}' failed."
                     return 2
                 fi
             fi
@@ -411,17 +569,15 @@ function xenguest_disk_init()
                             ;;
                         *)
                             # invalid/unknown compression type
-                            echo "${PREF} Invalid file format in disk ${content}"
+                            log error "Invalid file format in disk ${content}"
                             return 2
                             ;;
                     esac
                     # dd into partition
-                    echo "xenguest-mkimage extract-disk-file ${guestfile} " \
-                        "${content} | ${decompress} | dd of=/dev/xvda${part} " >> ${LOGFILE} 2>&1
-                    xenguest-mkimage extract-disk-file ${guestfile} ${content} \
-                        | ${decompress} | dd of=/dev/xvda${part} >> ${LOGFILE} 2>&1
+                    log verbose "Populating partition '${part}'"
+                    log_command "xenguest-mkimage extract-disk-file ${guestfile} ${content} | ${decompress} | dd of=/dev/xvda${part} "
                     if [ $? -ne 0 ]; then
-                        echo "${PREF} Cannot populate partition ${part}"
+                        log error "Populating partition '${part}' failed."
                         return 2
                     fi
                     ;;
@@ -442,37 +598,33 @@ function xenguest_disk_init()
                             ;;
                         *)
                             # invalid/unknown tar type
-                            echo "${PREF} Invalid file format in disk ${content}"
+                            log error "Invalid file format in disk ${content}"
                             return 2
                             ;;
                     esac
 
                     # must mount the partition and extract
                     mntdir=$(mktemp -d)
-                    echo "mount /dev/xvda${part} ${mntdir}" >> ${LOGFILE} 2>&1
-                    mount /dev/xvda${part} ${mntdir} >> ${LOGFILE} 2>&1
+                    log verbose "Mounting partition '${part}'"
+                    log_command "mount /dev/xvda${part} ${mntdir}"
                     if [ $? -ne 0 ]; then
-                        echo "${PREF} Cannot mount partition ${part}"
+                        log error "Mounting partition '${part}' failed."
                         rm -rf ${mntdir}
                         return 2
                     fi
 
                     # tar and unmount
-                    echo "xenguest-mkimage extract-disk-file ${guestfile}" \
-                        "${content} | tar -C ${mntdir} -x${tararg}f - " \
-                            >> ${LOGFILE} 2>&1
-                    xenguest-mkimage extract-disk-file ${guestfile} ${content} \
-                        | tar -C ${mntdir} -x${tararg}f - >> ${LOGFILE} 2>&1
+                    log_command "xenguest-mkimage extract-disk-file ${guestfile} ${content} |" \
+                    "tar -C ${mntdir} -x${tararg}f - "
                     if [ $? -ne 0 ]; then
-                        echo "${PREF} Cannot populate partition ${part}"
+                        log error "Cannot populate partition ${part}"
                         umount ${mntdir}
                         rm -rf ${mntdir}
                         return 2
                     fi
-                    echo "umount ${mntdir}" >> ${LOGFILE} 2>&1
-                    umount ${mntdir} >> ${LOGFILE} 2>&1
+                    log_command "umount ${mntdir}"
                     if [ $? -ne 0 ]; then
-                        echo "${PREF} Error unmounting ${part}"
+                        log error "Unmounting ${part} failed."
                         rm -rf ${mntdir}
                         return 2
                     fi
@@ -491,40 +643,42 @@ function xenguest_disk_init()
         fi
     done
 
+    log info "Initialised disk for guest '${guestname}' successfully"
+
 }
 
+# Private
 function xenguest_guest_create()
 {
-    check_private
-    guestfile="$1"
-    guestname="$2"
-
     # extract xenguest tar
     # put xen config in etc ?
     # if disk config file:
     #  disk init
     #  add partititions
 
-    echo "${PREF} Create ${guestname} using ${guestfile}"
-    rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}
-    mkdir -p ${XENGUEST_CONF_BASE}/guests/${guestname}
+    guestfile="$1"
+    guestname="$2"
+
+    log info "Attempting to create guest '${guestname}' using ${guestfile}"
+
+    check_private
+
+    log verbose "Cleaning up old directory"
+    log_command verbose "rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}"
+    log verbose "Creating directory for guest '${guestname}'"
+    log_command "mkdir -p ${XENGUEST_CONF_BASE}/guests/${guestname}"
 
-    echo "xenguest-mkimage extract-config ${guestfile}" \
-        "${XENGUEST_CONF_BASE}/guests/${guestname}" >> ${LOGFILE} 2>&1
-    xenguest-mkimage extract-config ${guestfile} \
-        ${XENGUEST_CONF_BASE}/guests/${guestname} >> ${LOGFILE} 2>&1
+    log verbose "Extracting guest image"
+    log_command "xenguest-mkimage extract-config ${guestfile} ${XENGUEST_CONF_BASE}/guests/${guestname}"
     if [ $? -ne 0 ]; then
-        echo "${PREF} Error extracting guest image"
-        exit 1
+        log fatal "Extracting guest image failed."
     fi
 
     # Set guest name inside config
-    echo "xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname}" \
-        "--xen-name=${guestname}" >> ${LOGFILE} 2>&1
-    xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname} \
-        --xen-name=${guestname} >> ${LOGFILE} 2>&1
+    log verbose "Setting guest name"
+    log_command "xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname} --xen-name=${guestname}"
     if [ $? -ne 0 ]; then
-        echo "${PREF} Error setting guest name"
+        log error "Setting guest name failed."
         xenguest_guest_remove ${guestname}
         exit 1
     fi
@@ -532,7 +686,7 @@ function xenguest_guest_create()
     xenguest_disk_init ${guestname} ${guestfile}
     disk_init_status=$?
     if [ $disk_init_status -ne 0 ]; then
-        echo "${PREF} Error: ${guestname} disk creation failed."
+        log error "Disk creation for guest '${guestname}' failed."
         if [ $disk_init_status -eq 2 ]; then
             xenguest_detach_disk
         fi
@@ -540,13 +694,18 @@ function xenguest_guest_create()
         exit 1
     fi
 
+    log info "Guest '${guestname}' created successfully"
+
 }
 
+# Private
 function xenguest_guest_remove()
 {
+    guestname="$1"
+    log info "Attempting to remove guest '${guestname}'"
+
     check_private
 
-    guestname="$1"
     source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
     if [ -z "${DISK_DEVICE}" ]; then
         # By default guest is using disk defined inside xenguest-manager.conf
@@ -561,31 +720,35 @@ function xenguest_guest_remove()
     devname="/dev/${volumename}/${guestname}"
 
     # check if guest had a volume
-    echo "lvs ${volumename}/${guestname}"  >> ${LOGFILE} 2>&1
-    lvs ${volumename}/${guestname} >> ${LOGFILE} 2>&1
+    log verbose "Checking if ${guestname} has a volume to remove"
+    log_command verbose "lvs ${volumename}/${guestname}"
     if [ $? -eq 0 ]; then
         # Remove guest volume
-        echo "${PREF} Removing ${guestname} volume. This might take a while..."
-        echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
-        lvremove -y "${devname}" >> ${LOGFILE} 2>&1
+        log info "Removing volume ${devname}. This might take a while..."
+        log_command "lvremove -y \"${devname}\""
         if [ $? -ne 0 ]; then
-            echo "${PREF} Error removing volume ${guestname}"
+            log error "Removing volume ${devname} failed."
             exit 1
         fi
     fi
 
     # remove guest files
-    echo "${PREF} Removing ${guestname} configuration files."
-    rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}
+    log info "Removing configuration files for guest '${guestname}'."
+    log_command "rm -rf ${XENGUEST_CONF_BASE}/guests/${guestname}"
+
+    log info "Removed guest '${guestname}' succesfully"
 }
 
+# Private
 function xenguest_guest_start()
 {
-    check_private
-
     guestname="${1}"
     guestdir=${XENGUEST_CONF_BASE}/guests/${guestname}
 
+    log info "Attempting to start guest '${guestname}'"
+
+    check_private
+
     guestcfgfile=$(mktemp -u "${guestname}.XXXXXX" --tmpdir="${guestdir}" --suffix=".cfg")
 
     # Get guest configuration
@@ -609,100 +772,93 @@ function xenguest_guest_start()
             sort) $(find ${guestdir}/init.post -type f 2> /dev/null | sort)"
 
     # call pre init scripts
+    log verbose "Calling pre-init scripts"
     for f in ${init_pre}; do
         if [ -x "$f" ]; then
-            echo "( . $f )" >> ${LOGFILE} 2>&1
-            ( . $f ) >> ${LOGFILE} 2>&1
+            log_source $f
             if [ $? -ne 0 ]; then
                 rm -f ${guestcfgfile}
                 popd > /dev/null 2>&1
-                echo "Error in init script $f" >> ${LOGFILE} 2>&1
-                echo "${PREF} Error during pre init script $(basename $f) of ${guestname}"
-                echo "${PREF} Check the log: ${LOGFILE} for more information"
-                exit 1
+                log fatal "Pre-init script $(basename $f) of ${guestname} returned non-zero status"
             fi
         else
-            echo "$f is not executable. Skipping." >> ${LOGFILE}
+            log fatal "$f is not executable. Exiting..."
         fi
     done
 
     # Create non started guest
-    echo "xl create -p ${guestcfgfile}" >> ${LOGFILE} 2>&1
-    xl create -p ${guestcfgfile} >> ${LOGFILE} 2>&1
+    log verbose "Initiating ${guestname}"
+    log_command "xl create -p ${guestcfgfile}"
     if [ $? -ne 0 ]; then
         rm -f ${guestcfgfile}
         popd > /dev/null 2>&1
-        echo "${PREF} Error starting ${guestname}"
-        exit 1
+        log fatal "Initiating ${guestname} failed."
     fi
 
     # call init scripts
+    log verbose "Calling init scripts"
     for f in ${init_d}; do
         if [ -x "$f" ]; then
-            echo "( . $f )" >> ${LOGFILE} 2>&1
-            ( . $f ) >> ${LOGFILE} 2>&1
+            log_source $f
             if [ $? -ne 0 ]; then
                 rm -f ${guestcfgfile}
-                echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
-                xl destroy ${guestname} >> ${LOGFILE} 2>&1
+                log_command "xl destroy ${guestname}"
                 popd > /dev/null 2>&1
-                echo "Error in init script $f" >> ${LOGFILE} 2>&1
-                echo "${PREF} Error during init script $(basename $f) of ${guestname}"
-                echo "${PREF} Check the log: ${LOGFILE} for more information"
-                exit 1
+                log fatal "Init script $(basename $f) of ${guestname} returned non-zero status"
             fi
         else
-            echo "$f is not executable. Skipping." >> ${LOGFILE}
+            log fatal "$f is not executable. Exiting..."
         fi
     done
 
     # Start guest
-    echo "xl unpause ${guestname}" >> ${LOGFILE} 2>&1
-    xl unpause ${guestname} >> ${LOGFILE} 2>&1
+    log info "Starting ${guestname}"
+    log_command "xl unpause ${guestname}"
     if [ $? -ne 0 ]; then
         rm -f ${guestcfgfile}
         popd > /dev/null 2>&1
-        echo "${PREF} Error starting ${guestname}"
-        exit 1
+        log fatal "Starting ${guestname} failed."
     fi
 
     # call post init scripts
+    log verbose "Calling post-init scripts"
     for f in ${init_post}; do
         if [ -x "$f" ]; then
-            echo "( . $f )" >> ${LOGFILE} 2>&1
-            ( . $f ) >> ${LOGFILE} 2>&1
+            log_source $f
             if [ $? -ne 0 ]; then
                 rm -f ${guestcfgfile}
-                echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
-                xl destroy ${guestname} >> ${LOGFILE} 2>&1
+                log_command "xl destroy ${guestname}"
                 popd > /dev/null 2>&1
-                echo "Error in init script $f" >> ${LOGFILE} 2>&1
-                echo "${PREF} Error during post init script $(basename $f) of ${guestname}"
-                echo "${PREF} Check the log: ${LOGFILE} for more information"
-                exit 1
+                log fatal "Post-init script $(basename $f) of ${guestname} returned non-zero status"
             fi
         else
-            echo "$f is not executable. Skipping." >> ${LOGFILE}
+            log fatal "$f is not executable. Exiting..."
         fi
     done
 
     rm -f ${guestcfgfile}
     popd > /dev/null 2>&1
+
+    log info "Guest '${guestname}' started successfully"
 }
 
+# Private
 function xenguest_guest_stop()
 {
+    guestname="${1}"
+    log info "Attempting to stop guest '${guestname}'"
+
     check_private
 
-    guestname="${1}"
-    echo "xl shutdown ${guestname}" >> ${LOGFILE} 2>&1
-    xl shutdown ${guestname} >> ${LOGFILE} 2>&1
+    log_command "xl shutdown ${guestname}"
     if [ $? -ne 0 ]; then
-        echo "${PREF} Error stopping ${guestname}"
-        exit 1
+        log fatal "Stopping guest '${guestname}' failed."
     fi
+
+    echo "Guest '${guestname}' may not have stopped yet. Use 'status' to check"
 }
 
+# Private
 function check_guest_arg()
 {
     check_private
@@ -710,51 +866,76 @@ function check_guest_arg()
     cmd="${1}"
     guestname="${2:-}"
     if [ -z "${guestname:-}" ]; then
-        echo "${PREF} Usage ${this} ${cmd} GUESTNAME"
-        exit 1
+        log fatal "Usage ${this} ${cmd} GUESTNAME"
     fi
 }
 
+# Public
 function check_guest_exist()
 {
     guestname="${1}"
     if [ ! -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg -o \
         ! -f ${XENGUEST_CONF_BASE}/guests/${guestname}/params.cfg ]; then
-        echo "${PREF} Invalid guest name: ${guestname}"
-        exit 1
+        log fatal "Invalid guest name '${guestname}'"
     fi
+
+    log verbose "Guest '${guestname}' found: ${XENGUEST_CONF_BASE}/guests/${guestname}/"
 }
 
+# Public
 function xl_list_contains()
 {
     guestname="${1}"
     # Select first column of xl list, and find guestname exactly using regex
     running=$(xl list | awk 'NR > 1 {print $1}' | grep "^${guestname}$" || echo)
     if [ "${running}" = "${guestname}" ]; then
+        log verbose "Guest '${guestname}' is running"
         return 0
     fi
 
+    log verbose "Guest '${guestname}' is not running"
+
     return 1
 }
 
+# Public
 function check_guest_running()
 {
     guestname="${1}"
     if ! xl_list_contains $guestname; then
-        echo "${PREF} Guest ${guestname} is not running"
-        exit 1
+        log fatal "Cannot ${cmd} guest '${guestname}', already stopped"
     fi
 }
 
+# Public
 function check_guest_not_running()
 {
     guestname="${1}"
     if xl_list_contains $guestname; then
-        echo "${PREF} Guest ${guestname} is running"
-        exit 1
+        log fatal "Cannot ${cmd} guest '${guestname}', already started"
     fi
 }
 
+## Entry Point ##
+
+# Check for verbose level arguments, and shift if found
+case ${1:-help} in
+    -v|-V)
+    LOG_LEVEL="INFO"
+    shift
+    ;;
+    -vv|-VV)
+    LOG_LEVEL="VERBOSE"
+    shift
+    ;;
+esac
+
+# Limit Verbose list to only those desired to be shown
+LOG_LEVEL_LIST=${LOG_LEVEL_LIST//${LOG_LEVEL}*/${LOG_LEVEL}}
+
+log ""
+log "Arguments: $*"
+
 cmd="${1:-help}"
 arg1="${2:-}"
 arg2="${3:-}"
@@ -764,30 +945,26 @@ case ${cmd} in
         usage
         exit 0
         ;;
-
 esac
 
 # Check if we have a valid Dom0 booted with Xen
-ERROR_MSG=$(xl info 2>&1)
+log_command "xl info"
 if [ $? -ne 0 ]; then
-    echo "ERROR: Xen environment is not valid!!!" | tee -a ${LOGFILE}
-    echo "ERROR: Check if Xen has booted and the kernel configuration." \
-        | tee -a ${LOGFILE}
-    echo "ERROR: Output from 'xl info' command:" | tee -a ${LOGFILE}
-    echo "$ERROR_MSG" | tee -a ${LOGFILE}
-    exit 1
+    log error "Xen environment is not valid!!!"
+    log error "Check if Xen has booted and the kernel configuration."
+    log fatal "More information in the logfile: ${LOGFILE}"
 fi
 
 case ${cmd} in
     check-xen)
+        log verbose "Valid Xen environment found"
         exit 0
         ;;
     create)
         guestfile="${arg1}"
         guestname="${arg2}"
         if [ -z "${guestfile}" -o ! -f "${guestfile}" ]; then
-            echo "${PREF} Usage ${this} create XENGUEST_FILE [NAME]"
-            exit 1
+            log fatal "Usage ${this} create XENGUEST_FILE [NAME]"
         fi
         if [ -z "${guestname}" ]; then
             guestname=$(basename ${guestfile} .xenguest)
@@ -795,28 +972,25 @@ case ${cmd} in
 
         if [ -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg ]; then
             # Guest already exist
-            echo "${PREF} A guest ${guestname} already exist"
-            exit 1
+            log fatal "Guest '${guestname}' already exists"
         fi
 
         xenguest_guest_create ${guestfile} ${guestname}
-        echo "${PREF} ${guestname} created."
         ;;
     remove)
         guestname="${arg1:-}"
         check_guest_arg ${cmd} ${guestname}
         check_guest_exist ${guestname}
+        log info "Guest '${guestname}' exists. Removing"
         # We need to stop the guest first if it is running
         if xl_list_contains $guestname; then
-            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
-            xl destroy ${guestname} >> ${LOGFILE} 2>&1
+            log info "Guest '${guestname}' is running. Killing..."
+            log_command "xl destroy ${guestname}"
             if [ $? -ne 0 ]; then
-                echo "${PREF} Error killing ${guestname}"
-                exit 1
+                log fatal "Killing guest '${guestname}' failed."
             fi
         fi
         xenguest_guest_remove ${guestname}
-        echo "${PREF} ${guestname} removed."
         ;;
     start)
         guestname="${arg1:-}"
@@ -837,17 +1011,17 @@ case ${cmd} in
         check_guest_arg ${cmd} ${guestname}
         check_guest_exist ${guestname}
         check_guest_running ${guestname}
-        echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
-        xl destroy ${guestname} >> ${LOGFILE} 2>&1
+        log info "Attempting to kill guest '${guestname}'"
+        log_command "xl destroy ${guestname}"
         if [ $? -ne 0 ]; then
-            echo "${PREF} Error killing ${guestname}"
-            exit 1
+            log fatal "Killing guest '${guestname}' failed."
         fi
+        log info "Guest '${guestname}' killed successfully"
         ;;
     list)
         if [ -d ${XENGUEST_CONF_BASE}/guests ]; then
-            for f in $(find ${XENGUEST_CONF_BASE}/guests -mindepth 1 \
-                -maxdepth 1 -type d -exec basename {} \;); do
+            list=$(find ${XENGUEST_CONF_BASE}/guests -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
+            for f in ${list}; do
                 if [ -f ${XENGUEST_CONF_BASE}/guests/$f/guest.cfg ]; then
                     echo "$f"
                 fi
@@ -856,15 +1030,15 @@ case ${cmd} in
         ;;
     status)
 
-        single_status() (
+        single_status() {
             guestname="${1}"
             check_guest_exist ${guestname}
             if xl_list_contains $guestname; then
-                echo "${guestname}: Running"
+                echo "${guestname} Running"
             else
-                echo "${guestname}: Stopped"
+                echo "${guestname} Stopped"
             fi
-        )
+        }
 
         guestname="${arg1}"
         if [ -n "${guestname}" ]; then
@@ -879,8 +1053,7 @@ case ${cmd} in
         fi
         ;;
     *)
-        echo "${PREF} Invalid argument ${cmd}"
-        exit 1
+        log fatal "Invalid argument: ${cmd}"
         ;;
 esac
 
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh
index aa43ce8..ce5e6de 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh
@@ -31,15 +31,14 @@ case "${XENGUEST_NETWORK_TYPE:-}" in
                 release_lock "vif-nat-kea"
                 exit 0
             fi
-            echo "Waiting for ${vif_name} - network interface is not ready..."\
-                 " try #${try}" >> "${LOGFILE}" 2>&1
+            log info "Waiting for ${vif_name} - network interface is not ready..."
+            log info "try #${try}"
             sleep 1
         done
-        echo "ERROR: Failed to get ${vif_name} "\
-             "network interface ready!" >> "${LOGFILE}" 2>&1
+        log error "Failed to get ${vif_name}. network interface ready!"
         exit 1
         ;;
     *)
-        echo "No action needed" >> "${LOGFILE}" 2>&1
+        log verbose "No action needed"
         ;;
 esac
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index c55d879..16a0700 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -9,6 +9,7 @@ LICENSE = "MIT"
 SRC_URI = " \
     file://xenguest-manager \
     file://xenguest-init \
+    file://logrotate-xenguest \
     "
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
@@ -19,6 +20,7 @@ S = "${WORKDIR}"
 XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/sda2"
 XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen-$(basename ${XENGUEST_MANAGER_VOLUME_DEVICE})"
 XENGUEST_MANAGER_GUEST_DIR ?= "${datadir}/guests/"
+XENGUEST_MANAGER_LOG_LEVEL ?= "ERROR"
 
 # We add an init script to create and start guests automatically
 # run start script after xen-tools and run stop script before xen-tools
@@ -34,6 +36,8 @@ do_compile() {
         xenguest-manager.conf
     echo "XENGUEST_GUEST_DIR=\"${XENGUEST_MANAGER_GUEST_DIR}\"" >> \
         xenguest-manager.conf
+    echo "XENGUEST_LOG_LEVEL=\"${XENGUEST_MANAGER_LOG_LEVEL}\"" >> \
+        xenguest-manager.conf
 }
 
 do_install() {
@@ -44,10 +48,13 @@ do_install() {
     install -d -m 755 ${D}${sysconfdir}/init.d
     install -m 755 xenguest-init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
     install -d -m 755 ${D}${XENGUEST_GUEST_DIR}
+    install -d -m 755 ${D}${sysconfdir}/logrotate.d
+    install -m 644 logrotate-xenguest ${D}${sysconfdir}/logrotate.d/xenguest
 }
 
 # Things that we need on the target
-RDEPENDS_${PN} += "bash tar xenguest-mkimage lvm2 xen-tools parted e2fsprogs dosfstools"
+RDEPENDS_${PN} += "bash tar xenguest-mkimage lvm2 xen-tools parted e2fsprogs \
+                   dosfstools logrotate"
 
 FILES_${PN} += "${bindir}/xenguest-manager \
                ${sysconfdir}/xenguest"
-- 
2.17.1

