Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.40])
 by mx.groups.io with SMTP id smtpd.web08.4866.1613461114997188475
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Feb 2021 23:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vlrN0uws;
 spf=pass (domain: arm.com, ip: 40.107.6.40, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4qyo329Dqba2ZTyNy7P62lJ2KL8bTwPdyHcrwZRNO4=;
 b=vlrN0uws401xplDpCjjcqaj7seF3EuQUnnyRWlOcB0ITiPoy5QqcvGszu+9/MxkvG/30/lu/5oVXq70HGYnrXSOmvnAUKWfI9D3UZsG2v1WgQCwZoyM6VRZFry5BnGU0Yo6cS27d4kadmjni4MK6rkabMz3XpDIbJiq6HE/se88=
Received: from DB9PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:10:1da::14)
 by DB7PR08MB3724.eurprd08.prod.outlook.com (2603:10a6:10:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Tue, 16 Feb
 2021 07:38:31 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::33) by DB9PR05CA0009.outlook.office365.com
 (2603:10a6:10:1da::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend
 Transport; Tue, 16 Feb 2021 07:38:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 07:38:31 +0000
Received: ("Tessian outbound 46f6cf9da5e8:v71"); Tue, 16 Feb 2021 07:38:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 26abf4d500c65cf7
X-CR-MTA-TID: 64aa7808
Received: from 733e728f9a19.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D9597BE0-A652-4E83-91D2-08FBDE86F432.1;
	Tue, 16 Feb 2021 07:38:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 733e728f9a19.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 16 Feb 2021 07:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evgTIqxpQDejlMbZrwPGXF4q6ywIQXCHHOfoPxYOfDWGCAZRkmwf17UbOD5hP9TfqKQ3J4uR+Vd0NPGS0cwtUyT4TysGPSNrOF1q59ncORxXTrOUgpOBbLaKhqiFNZGiXSbWQZXxx0/Vrc2GWrm/0Xk/uECHlBFaBnow29ynQm31fm+IJH+dgCz4seHx3WGdhdFBgmayoE/SjoUIzmJq8X788QrEnb+CD8jAuj9f+Q/nmK/qJkIC+iqAF3I2PmGehgyOmsIq2AX0azfMnyDBAESzPNR9+Y3z2N4Fo+URvWIGTVYAiZKN2vUsNiAuOTXv3wvpm8B7JGjNWdoX45pSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4qyo329Dqba2ZTyNy7P62lJ2KL8bTwPdyHcrwZRNO4=;
 b=AIRkk5dHn6ChG3oYboHHdgCM2H5FQDGUrt5Sdyb/rLgUoi7DfztfYrMtlmWp8OArqEpvEirzv43Uiz/ECAissDJXciwJDmXqcNjDYHixIaBEavZsCDsb2V0ODNZ+KXteWsEH/gy1sL7qmgUIg21/+Tb5Yk0th7Zk1Tdv68NL1RnyvsM1Lo/oMYuEVQ6CUihzqMpTS3aOX64HuE+P+acyVNFUY0nth4IEjFmiBoogQzLRmaavnO8FhXFjE9DDzRjp6aHLD7VYeavqK+MpaI/plh+6n48qdBLI8B2/aZY62pPPxAXXyrL6Ul+DPaC4LA/ONnpQKUR5E2c/JoDi2EB+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4qyo329Dqba2ZTyNy7P62lJ2KL8bTwPdyHcrwZRNO4=;
 b=vlrN0uws401xplDpCjjcqaj7seF3EuQUnnyRWlOcB0ITiPoy5QqcvGszu+9/MxkvG/30/lu/5oVXq70HGYnrXSOmvnAUKWfI9D3UZsG2v1WgQCwZoyM6VRZFry5BnGU0Yo6cS27d4kadmjni4MK6rkabMz3XpDIbJiq6HE/se88=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4965.eurprd08.prod.outlook.com (2603:10a6:20b:e5::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Tue, 16 Feb
 2021 07:38:24 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::a529:c785:3f1a:7732%6]) with mapi id 15.20.3846.039; Tue, 16 Feb 2021
 07:38:24 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-autonomy/arm64-autonomy-guest: Pin kernel version to 5.10.10+95379fec
Date: Tue, 16 Feb 2021 07:38:15 +0000
Message-Id: <90b5203255a35bd6c611c310c4369bfea21fcba6.1613461035.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <b52e49bceb7f7f1efb9f0436b737500aea5f0d13.1613461035.git.diego.sueiro@arm.com>
References: <b52e49bceb7f7f1efb9f0436b737500aea5f0d13.1613461035.git.diego.sueiro@arm.com>
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::29) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38 via Frontend Transport; Tue, 16 Feb 2021 07:38:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 95192450-080d-4c6b-307f-08d8d24ddb85
X-MS-TrafficTypeDiagnostic: AM6PR08MB4965:|DB7PR08MB3724:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3724BA4530A4C508DA05A8A392879@DB7PR08MB3724.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:590;OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QYbM5mKjG2ZhTG+MKnfVemXt/L4ySv1jJEHBh4Plzfaf7UI9ICf61hSSamL/eQKq/ePOr+lcUgqpFFdL1UzsFb13GLyjZEgYBunsc+pRlSPXmqLYaGNfbdyhFqT9CXe6rBgK0TjNAWnO0eWSLLkk2sbWlvjxZ0MLnqfkq96T119Fv5ZcM8Rvmk8F1kfl/yT0amu7U3j/ekq0R+XMMJok64cIofSVxcuPFBU5G5tT6ysEkZasx17BwzVj3v1CPOlVU9QqC4dgPQT3/+hm/BenPp5GSqNgYpucSgLRj0FYr2pyD/JCWQr6J6DyW+ZOVXKOS+wHgGnIiLNbymVeskSV3r550wf3qalBiNJhElYqn0BM7d/zpKtqeYg8sh696fKjoFPNOtz6LwsyFnSj5JKaeGYOIjJ0JE/9BsYcufrQseuJNjSNtufd5CoLdu1h9dnOMKFDILs0tkYOQLE+Bklo3xYiLBM7tlwC5Ad/5ROgUtPUnhII0rLMD6UZRKQHlotLwL1qrxQKUoMxOW2xasLOTQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(376002)(366004)(396003)(956004)(2616005)(8676002)(2906002)(52116002)(8936002)(66476007)(66946007)(6486002)(6666004)(5660300002)(36756003)(316002)(86362001)(478600001)(44832011)(66556008)(6916009)(16526019)(7696005)(4326008)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?GJ9ijHXDSVnrxnl7hfeo7Ao5FGxiwcPjiVFY3VBpVElOWYPMeAkLxeN8yqTF?=
 =?us-ascii?Q?BaG9ypUrPIs21/UIOcBsZJXM+lNNUHUe6c7BYiX7NVa1CWmhR09pw7sQ/qxW?=
 =?us-ascii?Q?UE2ReuCZnwQKK0pfJQ7LsKaXaF826PosM4m+6M+HutI0CjaItX7YszryhtMc?=
 =?us-ascii?Q?XuIhB6RCW4Ian+GWU1LO3g217096YHd7SwrQHXhCmUCEjJScsCBRgLme8Xyh?=
 =?us-ascii?Q?GsJTiidMAwD4hOqMT/PYcq2TnerG1Qcj5D25cS9Y+dgmmgMkTKJSyLGHQFl4?=
 =?us-ascii?Q?U1qnW8JErUXNGKPeRgV5UTAY1n4KW2fTH2B6cyGby7eVV3ZOnH6n8tcj5Zgz?=
 =?us-ascii?Q?qkFEHwTos8W1QFO7La+D6sUsUE91pUwa2uhrbRgUn3U02SYxJ0uRV/d9jIEu?=
 =?us-ascii?Q?mJF7VQZXkoRCZtLGeRMV0r4pSlYZubqN5zPZWC3BNluFDtBWedHOtE0a5rGk?=
 =?us-ascii?Q?JgxyuXlMJNSYO0BwVmrEovZGB0/h7GBDXqrtdBp4OaXHWDzmjDvmDlAIm9vL?=
 =?us-ascii?Q?ttomXas85MP1DygyQgh16YWameEW0G8rcMUeV8jQgZUKqWZRJHfzqXwh6mOP?=
 =?us-ascii?Q?UJdQfpGgw3eBfKsrbXhmIPlqGH0/JWvFwMFlM+PoK3WsXDa6gU6J9beMan+O?=
 =?us-ascii?Q?4N9KSA4H+fe7V9lMynSO4wuzF2oVxz0ZAIHyZuyUVrVCKXtHzS3ONMXoeHgN?=
 =?us-ascii?Q?IjtN90CG6xlrBlQOH/52ZM0iM4LZN1n1UFlZp99/BxUFR1spfxUCbEiczKr+?=
 =?us-ascii?Q?7TjaY5lShfP557wyHbYX92ynBaiTtVropeV0iYNAhZp0xP1TmSPupt0GrMCQ?=
 =?us-ascii?Q?tTeiRGGBNavto6yuTjRGIhaoJuyjBk9wW5jBOcAc5ywlGx7q6ohjzzfe6P0c?=
 =?us-ascii?Q?U2jTxX/87VoN5lcV/uWV+sWJdCXMWM+VNnnFIWm9pqPulAv4vwelblGAtCqt?=
 =?us-ascii?Q?t8pAt8ygIDzjeujQIj+A7g3hvYMZi0Ax02yJUvY2rSz6J164p5vuVpD/zf63?=
 =?us-ascii?Q?DtSVOHZYWuxunKHxwuNFrSa53bL9p2mSdMCNVNnnCYysCeEVWwCq338rvsiZ?=
 =?us-ascii?Q?sC6kpWx18rNa8jtZsEpsj3VXJJf5H7UBxUh4E8FdvnCv2np6W7YmS0wqdnhc?=
 =?us-ascii?Q?PEhBH/lg35w7Bp/LvwEl2dZ6BIfepFPX+Qzc60mRyZpcZTDnEYv38ZCPdeQN?=
 =?us-ascii?Q?+cY0vD77zPSxmfhPnqpI3jFFNj4973IuCXVX+WcyOiYGtP7Ffd6+Y9QB3wTL?=
 =?us-ascii?Q?BGOyO5bCgr0oqHy/ZcYKUECRJw5cskpvhst2+mt6XJcg9iRtVYHLm6xc9VVl?=
 =?us-ascii?Q?52Qqc6VyINPzInexb3C45Tbc?=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4965
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4708f86a-763d-40ed-a35e-08d8d24dd686
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tzMaQsL+wk1pBqbiJh7+fCkZ9NX5YBA348x53tXia1qKzMRVQwH8NR0ip4xkhsKKSXPTE4+8tM/ygjaz82mkP3ejZGhtDbjzBNjt6QnN2ecqdjVMMfYfnI9LsYs4K1JuAWBywpTCuqVrD6lM5bHXoPkngjZHV88zVq4ZGDaegY539e0JFx25dDgDDZgftcQjnHIEEKDHRcWWzX+cuXZhPiwUXhCVPfXmCy1AV8hv39MIqnhibv/Z/LwvjyKAQQ1yQFHS8fOkxom/nZR4+sFs6kIBGyqohb5sEDG//6LhvCzEG5GgZ0mgQM5CzcNZrZ6M6rp0NY+xO/xguUg9NsEIqDfbFgybAwrKOCVaTci/EwAF7yYuny3uZ22NJRUKrQIKtdWD/ZMgp+hWXH9XrJ8uo1v2zdjRQ8TAyyYVOe223JMoJq2XduGv6FzluYOXtoTd8jGjwrB80Ns2c8TuEFAVVPF8jQB4dSADewyOqk0evnnUH/mkpxojtHDCAYLM2YUoGuWTkI8H8rcNrk4el6kGE7+iGZ/FZZ7hkKEmdb816KyYqbzBgqNtUDqpP1wHXrpOQiVzGuOu7ofrxIYfdVuOx2r4mdHTZwezCeCF4S2AI+dbXVDJ9QU9VOpOsqGZXmCFUoW+IP/nU7qAZKVBVKizvQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(36840700001)(46966006)(6916009)(2906002)(8936002)(26005)(8676002)(4326008)(316002)(478600001)(47076005)(5660300002)(6486002)(86362001)(356005)(7696005)(956004)(6666004)(16526019)(70206006)(70586007)(2616005)(81166007)(336012)(36860700001)(82310400003)(44832011)(186003)(36756003)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 07:38:31.0098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95192450-080d-4c6b-307f-08d8d24ddb85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3724
Content-Type: text/plain

The arm64-autonomy-guest kernel from commit 3499ba8198ca ("xen: Fix event
channel callback via INTX/GSI") are hanging at `xen:balloon: Initialising
balloon driver`. Hence, pin the kernel to 5.10.10+95379fec which is its
parent commit.

Issue-Id: SCM-2151
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Change-Id: Ic4a652fc66f5a8da24d88f37fa1416c277707ff4
---
 meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
index 097b382..93f31af 100644
--- a/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
+++ b/meta-arm-autonomy/conf/machine/arm64-autonomy-guest.conf
@@ -13,5 +13,9 @@ IMAGE_FSTYPES += "tar.bz2"
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
 
+# Last known good version in which the guest is properly booting
+LINUX_VERSION = "5.10.10"
+SRCREV_machine_pn-linux-yocto = "95379fec8264d128f6452d6f4fc40ad6062f2fac"
+
 DISTRO_FEATURES += "arm-autonomy-guest"
 
-- 
2.17.1

