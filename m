Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web12.10432.1610464879759233009
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jan 2021 07:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3mKNILk0;
 spf=pass (domain: arm.com, ip: 40.107.8.77, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+0KdCrYZ9dLkyNDYCD7unRB6YIhGUpGKQy7HL/zSzs=;
 b=3mKNILk02sroQkFPtxRTSr8lxgnH/FgQ4mOoycNS+Ilde4lmxjgL3o925/Lvg515HG+1AAAMANKlLHW342qFy1SB3GdKNuaZWgseS5f+mGosqCN0XCU6jjRz5f7bDADoO9sDdS4sAtry9d8mcHGrCzL1O1ZdqS6nIqFGdm1RSAA=
Received: from DB6P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::30) by
 AM6PR08MB3719.eurprd08.prod.outlook.com (2603:10a6:20b:83::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Tue, 12 Jan 2021 15:21:15 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::1c) by DB6P195CA0020.outlook.office365.com
 (2603:10a6:4:cb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 12 Jan 2021 15:21:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:15 +0000
Received: ("Tessian outbound af289585f0f4:v71"); Tue, 12 Jan 2021 15:21:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59ca14ef22ed42d9
X-CR-MTA-TID: 64aa7808
Received: from d12220608688.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 57633E94-9844-4C7B-B2A0-240AA5713E82.1;
	Tue, 12 Jan 2021 15:21:08 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d12220608688.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jan 2021 15:21:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgvN2Ii1ar4qBptL3ACU8kPjC/2/m4Xt80roN9c5LlDWWs05Gp/t6dm/Ys8/5GDeC3kRBbxTutyEfS1hE9ZbOy3oR3A09DGcBcgNXg6OT8GCKxsBtOiiteObi+datL+R+I3foyI+Pxoa1yLqcPceWOpHOIL+h5ErmSvgMlHO6keBg7Cwqba6oWbnXMTDpwRxvEXy3a8onNzYTunkojqDhhFC7oE96H6TFosnFWhcPmD3WMi9Zx8kijR3YLjbOyRIOB4S+GYDvPFpdK+2/PyhvinIMYnrfWe8fXIHAMdzCLrpV8bmdTqeCb+m9Dsset9xwJKCP81IMxMuOCPIOp0TUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+0KdCrYZ9dLkyNDYCD7unRB6YIhGUpGKQy7HL/zSzs=;
 b=I3jIrLqGqr+ayQEz8ekWJxfZbTx+QUxFm3N8lKwUG4DKHB1XvHDS31vw0l67wRBeLxsNO7uAbgSEv33zTJHATkfgpUYoG7ZrkE9TpN9vr8Ldf4IrNxpTBBXMC1PVFKntFhdVZXhQjBNoSaSyaMuvOAZDF7MMpFBJpZ+Z4RbSmCuqD1lJx0EgzK5OeDFCQpF+Zreegtzcy3CGcsNvwbDADhncpETYrZBoYuCkI1oRbunjpOkmyUN/AgaYDE3berxt6SZoY7gDSofkEZ9dfNJO2vYetXj6dXQvwd4mcP+CoV1XC9CZTw+z0wP+/zNlag1uOY9ekMXPQHtJX62wQFSZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+0KdCrYZ9dLkyNDYCD7unRB6YIhGUpGKQy7HL/zSzs=;
 b=3mKNILk02sroQkFPtxRTSr8lxgnH/FgQ4mOoycNS+Ilde4lmxjgL3o925/Lvg515HG+1AAAMANKlLHW342qFy1SB3GdKNuaZWgseS5f+mGosqCN0XCU6jjRz5f7bDADoO9sDdS4sAtry9d8mcHGrCzL1O1ZdqS6nIqFGdm1RSAA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com (2603:10a6:803:13d::20)
 by VI1PR08MB3053.eurprd08.prod.outlook.com (2603:10a6:803:45::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 15:21:05 +0000
Received: from VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024]) by VI1PR08MB5454.eurprd08.prod.outlook.com
 ([fe80::b4b8:2245:9a5b:1024%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:21:05 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Subject: [PATCH 09/10] arm-bsp/linux: add ffa transport in optee driver for TC0
Date: Tue, 12 Jan 2021 15:20:48 +0000
Message-ID: <20210112152049.3436645-9-arunachalam.ganapathy@arm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
References: <20210112152049.3436645-1-arunachalam.ganapathy@arm.com>
X-Originating-IP: [217.140.106.54]
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To VI1PR08MB5454.eurprd08.prod.outlook.com
 (2603:10a6:803:13d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ts710.cambridge.arm.com (217.140.106.54) by LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 15:21:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2e13ea9-d5db-47df-0769-08d8b70db3cc
X-MS-TrafficTypeDiagnostic: VI1PR08MB3053:|AM6PR08MB3719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3719167D25A5541C56490F07FBAA0@AM6PR08MB3719.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:187;OLM:187;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WqHFcvNTs2NUsLeUmnUmapCqUaRBkJcJT0sAvyyC+jpsJO6KtbT3qbtHZbCoj86f+irzP+oiNmFS7scZBCCoeVLe/IowPPjfPJQ6DdIYfsN6p5ujZkSnYQQ7/HsKbxJOZaCGl0J4LPzy7DeVAfCprm85x3j0y38YOVNHEHHGZNAt55AnI7IiqIGMwuiOvDJMpnnp1WMbJGlAf7qg5qCcyrg6PopgOnJ1NMcGIX6+5comgg0rZmL0MsRSuo7Ziqptu0Gm3yVNvlptBf/CLM8UaS69u/ID4jm19ijfqxaCwPNPgjLEZ9YP3S/ukU8aHXvibzjNvQJWOHh7ASgslPwd1JMrb52XH9ITOWHXQoZNv2SMoZ7rbsUtBCU7khrnSmD+i39IOz264UXAB+Bk8HhQljbAlXh/vxKs3HKQzJkfhLuV//txgAxD23GkOzPq/W/1JV8buiCJ6SRPEJKrds9Mfg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB5454.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(66946007)(30864003)(1076003)(36756003)(6666004)(16526019)(66476007)(66574015)(83380400001)(44832011)(186003)(5660300002)(8676002)(4326008)(7696005)(52116002)(2906002)(66556008)(8936002)(2616005)(956004)(6486002)(26005)(6916009)(478600001)(86362001)(316002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cnVDdFZqSUQ2UXZ6VnBCMG02a3N2TnVhMGRBbWtVV0N3MmtVZkpnOVpKc25M?=
 =?utf-8?B?aEdTbDM3ZW9yRHd4VGJqTzNVWHc1UGExY2JBbWdNOHo4dkhvcit1ZlNlNmpZ?=
 =?utf-8?B?Y2F5T1ZyR1lTblRDaHloSHF6eW9aNUIveVlpQ0JZejJ2OXZNN0FrTm8wdVNW?=
 =?utf-8?B?QjVpVGs5MnEwVEU5b1I0K1BzUWRLZXVZNzRIcytvcC9jMzBsWGxvS0JOQ3dU?=
 =?utf-8?B?K2pFUTNvR0tjZGRQOXNXN0k2SHcwRmYyU05YZTk4bXMyTUtKckVobWxuaDB4?=
 =?utf-8?B?eGF3MzVOOThoY0lIT0NDZ2FCU0lFV25tenR5Wk5JOWsvN1BZZWtuNkJWN216?=
 =?utf-8?B?b1JsY1ZYT1VSNm5tN2ZpSi9wY2tWVnlVN0s4RDkyaktVTGhWOUpaU296U09v?=
 =?utf-8?B?SXBXb2JBdU5DZjlXbGF2UW9lcW1telRiR0tzTnNkR1FNMXF0MDFOeEJteDVI?=
 =?utf-8?B?UmJ3QllyMkpQYU9kR0xJSDFuY1g2QkpyUEgyL0J3Y1F2bXh6ckVWSzRUTURj?=
 =?utf-8?B?VU81T3k3U0VzN0VvcCtmMGNlZHFtc0w1ZXhaQlBCa3ltaWJ2THpQUE15Z3hU?=
 =?utf-8?B?WXBIT3VlcVIxN1l4bHJKa3g4V3hjRWhKUlpDZHEva0h3aDZlK2ZZOWg4RXc4?=
 =?utf-8?B?U2E0Q3Zxb1RuRXFPV0pISkUraDZoL1ZNRXpLSlMxYXcrYmZEWnF6Q3Q4amZk?=
 =?utf-8?B?NHFlNEUrM3JQOEdtZjRTbUk1VGNtc2tiYi9JeDRiL0dlU3ZEKyt2L1owbjJU?=
 =?utf-8?B?Z283dVRPdC9nQ1VVZFhobWwySXp0ZHRVM2cyak9iVmZwV2ZMUnJTYllwMEhx?=
 =?utf-8?B?YTA5RUZza0FlZEFpNExYdkhQeG9mUXp0dTR2U2FoeUQ5dSs1RFJrTUZicmJv?=
 =?utf-8?B?ZTN4MUJiZGl4YjNiVDgvMkozZGNWQnhpZXpseGI5TEpXQ0FHRDFZNVRQTUx2?=
 =?utf-8?B?cXB3ZVpEcnF2WEdkcHYwVWV6U1luS1gyZzBHVEVaQkkwRUxtcjBhRzIvdzd3?=
 =?utf-8?B?a3BGaktpeXIzQnAzUmsyTnZVRm4rL3NycXdNUkZVcTlEV2MvOFhBcEVhWU1L?=
 =?utf-8?B?ZHpXY3dmQ0xRQ2VReWxSbmpjeWtYUXJHZDNTSzlxOXA5WjRhbS9jQzZzY0ZL?=
 =?utf-8?B?ZkxlM3hKaUZ2emZMN3k0UmZRNU1TaXJ4UytGZTIySjY5QmVtS2s2VFhnVmVm?=
 =?utf-8?B?UHUvUUdoWTkwV2o5MFN6VERnblR4R2cwQW5SRjB0WmNkTkFsWSt4UFp1RVNa?=
 =?utf-8?B?THlITUZCYzJtR2s1SUVuVDQvQm9tOWd4K0VicG51TVUyOURxZVM1L0NuTkRr?=
 =?utf-8?Q?5UNY9DyzI0/qwUr2HZ4v5iLnNaqvoEGPKN?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3053
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6878e599-f766-4321-54af-08d8b70dadfd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eIqXXLL20BwgJtcQs1CWB/WSHmDX6FaaEgADQvLRjZghzQD+36h/l563i63I+Xef4Ynfvz+fcReZteivG0tP4Rct5MeaTEgRriy0y2iYZ5ufnl/LgYsUNNmb0Uju3GK44ZKz9aimsAafWqFTm5n+lkNSfA1YtR1dUNXZyTQ694uhe4pCxOHnMFaixoGQlumIfDS6bLPyMk1v1DUG3Re6/1B3M8lhrYUMR+NwMWYHPvYZ9D0nTXe356M0Gmflu8+mgic8p5dZYpVaEDf1zqmZ3LJ8efg4zPnbw+tEE2Tu/95Sb4FhyKXa7PidPHz6YBKDyFrycclt0SoBlRU93SZV5y7MXnAHZGH6Ahz2ryUXdULpYJILzr9K61LdaJehQ+lenIVfPDPOlt6y1urBWiQCtZQeSYXUHW8vwMS+3hF38xjDggxXBmi/J+PZA114mJ31eT0CDn7+rIE0ZdaNVMNl2QCXl54ld/dNH8w/YAa0Kufl7irWpsjVydgnulM2Uam7sH4Jm6RJSSbDwBck/cxukc20R4nps0BhuaitIH9aISY6JCrdVBPYCH8/+t0Czra1
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(46966006)(956004)(336012)(81166007)(2616005)(70206006)(356005)(83380400001)(6666004)(4326008)(8676002)(6486002)(26005)(86362001)(36756003)(47076005)(1076003)(82740400003)(66574015)(7696005)(44832011)(5660300002)(16526019)(34020700004)(478600001)(30864003)(2906002)(316002)(8936002)(186003)(70586007)(82310400003)(6916009)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:21:15.1795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e13ea9-d5db-47df-0769-08d8b70db3cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3719
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch adds FF-A transport driver for optee driver. This is based
on prototype version released by Arm and its port for android11-5.4-lts
kernel.

Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
Change-Id: I991895881c069767854ae8a0722cdc282b221dd9
---
 .../linux/linux-arm-platforms.inc             |    4 +
 ...for-session-s-client-UUID-generation.patch |  252 ++
 ...pport-for-session-login-client-UUID-.patch |   43 +
 ...iver-optee-Support-for-ffa-transport.patch | 3150 +++++++++++++++++
 ...m-handle-removal-in-ffa_shm_unregist.patch |   51 +
 5 files changed, 3500 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0010-tee-add-support-for-session-s-client-UUID-generation.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0011-tee-optee-Add-support-for-session-login-client-UUID-.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0012-driver-optee-Support-for-ffa-transport.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/t=
c0/0013-tee-optee-fix-mem-handle-removal-in-ffa_shm_unregist.patch

diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 873f120..839fe68 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -77,6 +77,10 @@ SRC_URI_append_tc0 =3D " \
     file://0007-firmware-arm_scmi-Add-fast_switch_possible-api.patch \
     file://0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch=
 \
     file://0009-driver-firmware-Initial-version-of-ffa-driver-based-.patch=
 \
+    file://0010-tee-add-support-for-session-s-client-UUID-generation.patch=
 \
+    file://0011-tee-optee-Add-support-for-session-login-client-UUID-.patch=
 \
+    file://0012-driver-optee-Support-for-ffa-transport.patch \
+    file://0013-tee-optee-fix-mem-handle-removal-in-ffa_shm_unregist.patch=
 \
     "
=20
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0010=
-tee-add-support-for-session-s-client-UUID-generation.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0010-tee-add-support-for-sessi=
on-s-client-UUID-generation.patch
new file mode 100644
index 0000000..269940e
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0010-tee-ad=
d-support-for-session-s-client-UUID-generation.patch
@@ -0,0 +1,252 @@
+Upstream-Status: Backport [https://github.com/linaro-swg/linux/commit/e33b=
cbab16d1c0dd85d72bec275308369ad901f5#diff-317c0445401e56bde9d2ee0e0bb2758b0=
362a4099dca8e535dd20f1f649ecfc8]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 69a50f4234d8fb143d499e92e3f0f67009bae586 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Wed, 22 Apr 2020 15:28:07 +0300
+Subject: [PATCH] tee: add support for session's client UUID generation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+TEE Client API defines that from user space only information needed for
+specified login operations is group identifier for group based logins.
+
+REE kernel is expected to formulate trustworthy client UUID and pass that
+to TEE environment. REE kernel is required to verify that provided group
+identifier for group based logins matches calling processes group
+memberships.
+
+TEE specification only defines that the information passed from REE
+environment to TEE environment is encoded into on UUID.
+
+In order to guarantee trustworthiness of client UUID user space is not
+allowed to freely pass client UUID.
+
+UUIDv5 form is used encode variable amount of information needed for
+different login types.
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+Change-Id: I414f68d7485f95277d292fcb2646cc41bd57e62a
+---
+ drivers/tee/Kconfig     |   1 +
+ drivers/tee/tee_core.c  | 143 ++++++++++++++++++++++++++++++++++++++++
+ include/linux/tee_drv.h |  16 +++++
+ 3 files changed, 160 insertions(+)
+
+diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
+index 676ffcb64985..5a56317f3f4e 100644
+--- a/drivers/tee/Kconfig
++++ b/drivers/tee/Kconfig
+@@ -3,6 +3,7 @@
+ config TEE
+ 	tristate "Trusted Execution Environment support"
+ 	depends on HAVE_ARM_SMCCC || COMPILE_TEST
++	select CRYPTO_SHA1
+ 	select DMA_SHARED_BUFFER
+ 	select GENERIC_ALLOCATOR
+ 	help
+diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
+index 0f16d9ffd8d1..3d32a2ca48c3 100644
+--- a/drivers/tee/tee_core.c
++++ b/drivers/tee/tee_core.c
+@@ -6,18 +6,33 @@
+ #define pr_fmt(fmt) "%s: " fmt, __func__
+=20
+ #include <linux/cdev.h>
++#include <linux/cred.h>
+ #include <linux/fs.h>
+ #include <linux/idr.h>
+ #include <linux/module.h>
+ #include <linux/slab.h>
+ #include <linux/tee_drv.h>
+ #include <linux/uaccess.h>
++#include <crypto/hash.h>
++#include <crypto/sha.h>
+ #include "tee_private.h"
+=20
+ #define TEE_NUM_DEVICES	32
+=20
+ #define TEE_IOCTL_PARAM_SIZE(x) (sizeof(struct tee_param) * (x))
+=20
++#define TEE_UUID_NS_NAME_SIZE	128
++
++/*
++ * TEE Client UUID name space identifier (UUIDv4)
++ *
++ * Value here is random UUID that is allocated as name space identifier f=
or
++ * forming Client UUID's for TEE environment using UUIDv5 scheme.
++ */
++static const uuid_t tee_client_uuid_ns =3D UUID_INIT(0x58ac9ca0, 0x2086, =
0x4683,
++						   0xa1, 0xb8, 0xec, 0x4b,
++						   0xc0, 0x8e, 0x01, 0xb6);
++
+ /*
+  * Unprivileged devices in the lower half range and privileged devices in
+  * the upper half range.
+@@ -111,6 +126,134 @@ static int tee_release(struct inode *inode, struct f=
ile *filp)
+ 	return 0;
+ }
+=20
++/**
++ * uuid_v5() - Calculate UUIDv5
++ * @uuid: Resulting UUID
++ * @ns: Name space ID for UUIDv5 function
++ * @name: Name for UUIDv5 function
++ * @size: Size of name
++ *
++ * UUIDv5 is specific in RFC 4122.
++ *
++ * This implements section (for SHA-1):
++ * 4.3.  Algorithm for Creating a Name-Based UUID
++ */
++static int uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
++		   size_t size)
++{
++	unsigned char hash[SHA1_DIGEST_SIZE];
++	struct crypto_shash *shash =3D NULL;
++	struct shash_desc *desc =3D NULL;
++	int rc;
++
++	shash =3D crypto_alloc_shash("sha1", 0, 0);
++	if (IS_ERR(shash)) {
++		rc =3D PTR_ERR(shash);
++		pr_err("shash(sha1) allocation failed\n");
++		return rc;
++	}
++
++	desc =3D kzalloc(sizeof(*desc) + crypto_shash_descsize(shash),
++		       GFP_KERNEL);
++	if (IS_ERR(desc)) {
++		rc =3D PTR_ERR(desc);
++		goto out;
++	}
++
++	desc->tfm =3D shash;
++
++	rc =3D crypto_shash_init(desc);
++	if (rc < 0)
++		goto out2;
++
++	rc =3D crypto_shash_update(desc, (const u8 *)ns, sizeof(*ns));
++	if (rc < 0)
++		goto out2;
++
++	rc =3D crypto_shash_update(desc, (const u8 *)name, size);
++	if (rc < 0)
++		goto out2;
++
++	rc =3D crypto_shash_final(desc, hash);
++	if (rc < 0)
++		goto out2;
++
++	memcpy(uuid->b, hash, UUID_SIZE);
++
++	/* Tag for version 5 */
++	uuid->b[6] =3D (hash[6] & 0x0F) | 0x50;
++	uuid->b[8] =3D (hash[8] & 0x3F) | 0x80;
++
++out2:
++	kfree(desc);
++
++out:
++	crypto_free_shash(shash);
++	return rc;
++}
++
++int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
++				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
++{
++	const char *application_id =3D NULL;
++	gid_t ns_grp =3D (gid_t)-1;
++	kgid_t grp =3D INVALID_GID;
++	char *name =3D NULL;
++	int rc;
++
++	if (connection_method =3D=3D TEE_IOCTL_LOGIN_PUBLIC) {
++		/* Nil UUID to be passed to TEE environment */
++		uuid_copy(uuid, &uuid_null);
++		return 0;
++	}
++
++	/*
++	 * In Linux environment client UUID is based on UUIDv5.
++	 *
++	 * Determine client UUID with following semantics for 'name':
++	 *
++	 * For TEEC_LOGIN_USER:
++	 * uid=3D<uid>
++	 *
++	 * For TEEC_LOGIN_GROUP:
++	 * gid=3D<gid>
++	 *
++	 */
++
++	name =3D kzalloc(TEE_UUID_NS_NAME_SIZE, GFP_KERNEL);
++	if (!name)
++		return -ENOMEM;
++
++	switch (connection_method) {
++	case TEE_IOCTL_LOGIN_USER:
++		scnprintf(name, TEE_UUID_NS_NAME_SIZE, "uid=3D%x",
++			  current_euid().val);
++		break;
++
++	case TEE_IOCTL_LOGIN_GROUP:
++		memcpy(&ns_grp, connection_data, sizeof(gid_t));
++		grp =3D make_kgid(current_user_ns(), ns_grp);
++		if (!gid_valid(grp) || !in_egroup_p(grp)) {
++			rc =3D -EPERM;
++			goto out;
++		}
++
++		scnprintf(name, TEE_UUID_NS_NAME_SIZE, "gid=3D%x", grp.val);
++		break;
++
++	default:
++		rc =3D -EINVAL;
++		goto out;
++	}
++
++	rc =3D uuid_v5(uuid, &tee_client_uuid_ns, name, strlen(name));
++out:
++	kfree(name);
++
++	return rc;
++}
++EXPORT_SYMBOL_GPL(tee_session_calc_client_uuid);
++
+ static int tee_ioctl_version(struct tee_context *ctx,
+ 			     struct tee_ioctl_version_data __user *uvers)
+ {
+diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
+index 7a03f68fb982..545a57f61a5e 100644
+--- a/include/linux/tee_drv.h
++++ b/include/linux/tee_drv.h
+@@ -166,6 +166,22 @@ int tee_device_register(struct tee_device *teedev);
+  */
+ void tee_device_unregister(struct tee_device *teedev);
+=20
++/**
++ * tee_session_calc_client_uuid() - Calculates client UUID for session
++ * @uuid:		Resulting UUID
++ * @connection_method:	Connection method for session (TEE_IOCTL_LOGIN_*)
++ * @connectuon_data:	Connection data for opening session
++ *
++ * Based on connection method calculates UUIDv5 based client UUID.
++ *
++ * For group based logins verifies that calling process has specified
++ * credentials.
++ *
++ * @return < 0 on failure
++ */
++int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
++				 const u8 connection_data[TEE_IOCTL_UUID_LEN]);
++
+ /**
+  * struct tee_shm - shared memory object
+  * @teedev:	device used to allocate the object
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0011=
-tee-optee-Add-support-for-session-login-client-UUID-.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0011-tee-optee-Add-support-for=
-session-login-client-UUID-.patch
new file mode 100644
index 0000000..65d4311
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0011-tee-op=
tee-Add-support-for-session-login-client-UUID-.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Backport [https://github.com/linaro-swg/linux/commit/c5b4=
312bea5d5e5e3d4f0af640e2ef8a1c1bb167#diff-2d83bca4adf0468bdb51b155a5df495e0=
226f7971f4150cfffbf043fe3b5a279]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From c6c4046d8fcd34a4b8da9d844ce592951780ba8c Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Wed, 22 Apr 2020 15:30:39 +0300
+Subject: [PATCH] tee: optee: Add support for session login client UUID
+ generation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Adds support for client UUID generation for OP-TEE. For group based sessio=
n
+logins membership is verified.
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ drivers/tee/optee/call.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
+index cf2367ba08d6..dbed3f480dc0 100644
+--- a/drivers/tee/optee/call.c
++++ b/drivers/tee/optee/call.c
+@@ -233,9 +233,13 @@ int optee_open_session(struct tee_context *ctx,
+ 	msg_arg->params[1].attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT |
+ 				  OPTEE_MSG_ATTR_META;
+ 	memcpy(&msg_arg->params[0].u.value, arg->uuid, sizeof(arg->uuid));
+-	memcpy(&msg_arg->params[1].u.value, arg->uuid, sizeof(arg->clnt_uuid));
+ 	msg_arg->params[1].u.value.c =3D arg->clnt_login;
+=20
++	rc =3D tee_session_calc_client_uuid((uuid_t *)&msg_arg->params[1].u.valu=
e,
++					  arg->clnt_login, arg->clnt_uuid);
++	if (rc)
++		goto out;
++
+ 	rc =3D optee_to_msg_param(msg_arg->params + 2, arg->num_params, param);
+ 	if (rc)
+ 		goto out;
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0012=
-driver-optee-Support-for-ffa-transport.patch b/meta-arm-bsp/recipes-kernel=
/linux/linux-arm64-ack-5.4/tc0/0012-driver-optee-Support-for-ffa-transport.=
patch
new file mode 100644
index 0000000..40d4ffe
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0012-driver=
-optee-Support-for-ffa-transport.patch
@@ -0,0 +1,3150 @@
+Upstream-Status: Pending [https://git.kernel.org/pub/scm/linux/kernel/git/=
sudeep.holla/linux.git/commit/?h=3Dffa_rel_proto&id=3D8a0acded67268b7110c69=
ed5425c56d881716d78]
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+
+From 2e12bf893c180cb1444ca20148983d1c45431c71 Mon Sep 17 00:00:00 2001
+From: Jens Wiklander <jens.wiklander@linaro.org>
+Date: Tue, 30 Oct 2018 21:12:11 +0100
+Subject: [PATCH] driver: optee: Support for ffa transport
+
+FF-A transport support for optee driver. Based on ffa_rel_proto at
+https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/log=
/?h=3Dffa_rel_proto
+
+Squashed in:
+    tee: remove linked list of struct tee_shm
+
+    Removes list_shm from struct tee_context since the linked list isn't u=
sed
+    any longer.
+
+    tee: remove unused tee_shm_priv_alloc()
+
+    tee_shm_priv_alloc() isn't useful in the current state and it's also n=
ot
+    not used so remove it.
+
+    tee: don't assign shm id for private shms
+
+    Private shared memory object must not be referenced from user space. T=
o
+    guarantee that don't assign an id to keep the shared memory driver
+    private.
+
+    tee: remove redundant teedev in struct tee_shm
+
+    Since the ctx element in struct tee_shm always is valid has the teedev
+    element become redundant so remove it.
+
+    tee: add sec_world_id to struct tee_shm
+
+    Adds sec_world_id to struct tee_shm which describes a shared memory
+    object. sec_world_id can be used by a driver to store an id assigned b=
y
+    secure world.
+
+    tee: tee_shm_op_mmap(): use TEE_SHM_USER_MAPPED
+
+    tee_shm_op_mmap() uses the TEE_SHM_USER_MAPPED flag instead of the
+    TEE_SHM_REGISTER flag to tell if a shared memory object is originating
+    from registered user space memory.
+
+    Set -Og flags for the OPTEE driver compilation.
+
+    optee: simplify optee_release()
+
+    Simplifies optee_release() with a new helper function,
+    optee_close_session_helper() which has been factored out from
+    optee_close_session().
+
+    A separate optee_release_supp() is added for the supplicant device.
+
+    tee: optee: sync optee_msg.h and optee_rpc_cmd.h
+
+    Updates to latest optee_msg.h and optee_rpc_cmd.h. There's no changes =
in
+    the ABI. Only some clarifications and a complete specification of RPC
+    requests where the latter is now in a separate file, optee_rpc_cmd.h.
+
+    Most of the RPC requests are not served by the OP-TEE driver instead
+    they are forwarded as opaque requests to tee-supplicant.
+
+    tee: export tee_shm_alloc()
+
+    Export tee_shm_alloc() using EXPORT_SYMBOL_GPL(). Needed by
+    optee_rng_init() and other drivers complied as a module and using OP-T=
EE
+    as a service.
+
+    optee: add spci support
+
+    Adds support for using SPCI as transport to the OP-TEE driver.
+
+    tee: optee: introduce SPCI specific OPTEE_MSG memref
+
+    Introduces struct optee_msg_param_smem which carries all information
+    needed when OP-TEE is calling SPCI_MEM_RETRIEVE_REQ to get the shared
+    memory reference mapped by the hypervisor in S-EL2. Register usage is
+    also updated to include the information needed.
+
+    This isn't strictly needed without a hypervisor in S-EL2 and OP-TEE
+    itself has the SPMC part. However, this is a configuration which
+    shouldn't concern normal world.
+
+    tee: optee: Use PARTITION_INFO_GET to get SP ID.
+
+    Instead of using a hardcoded partition ID for OPTEE, use the
+    SPCI_PARTITION_INFO_GET ABI to find the partition ID corresponding to
+    the OPTEE UUID.
+
+    tee: optee: Update OPTEE for mem_share SPCI
+
+    Update OPTEE to pass a scatterlist in the mem_share interface.
+
+    tee: Adapt OPTEE to new SPCI mem_share interface
+
+    optee: test_spci: Update optee, spci test driver [optee bits]
+
+    Enable optee and spci test drivesr to pass a scatterlist* and a nents
+    parameter in mem_share.
+
+    arm_spci: refactor mem_share implementation for EAC [optee bits]
+
+    arm_ffa: optee: Swap spci/SPCI for ffa/FFA. [optee bits]
+
+    arm_ffa: rename 1st member of arm_smcccv1_2_return [optee bits]
+
+    The smcccv1_2_return.func is renamed to arg0.
+
+    tee: add sec_world_id to struct tee_shm
+
+    Change the type of sec_world_id member of struct tee_shm to u64 to be
+    able to store the 64-bit Global Handle defined in FF-A.
+
+    optee: updated for FF-A 1.0
+
+    With FF-A 1.0 the ABI to secure world has changed compared to SPCI
+    beta1.
+
+    The globally unique handle to identify a shared memory object is now 6=
4
+    bits wide instead of previous 32. The IDR in struct optee_ffa is
+    replaced with a struct rhashtable instead in order to support 64-bit
+    keys.
+
+    Register usage in the FF-A function has changed compared to SPCI beta1
+    so the OP-TEE ABI is updated accordingly. The global handle, aka cooki=
e,
+    is now requires 2 registers.
+
+    struct optee_msg_param_smem is updated to be able to carry a 64-bit
+    global handle while maintaining the same size of the struct. Due to th=
is
+    the "page_count" field is dropped.
+
+    optee: Update SMCC field name
+
+    optee: Update FFA_VERSION from 0.9 to 1.0
+
+    optee/call.c: Update SPCI reference to FFA
+
+Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
+Signed-off-by: Marc Bonnici <marc.bonnici@arm.com>
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+---
+ drivers/tee/Makefile              |   1 +
+ drivers/tee/optee/Makefile        |   1 +
+ drivers/tee/optee/call.c          | 318 ++++++++++---
+ drivers/tee/optee/core.c          | 735 +++++++++++++++++++++++++-----
+ drivers/tee/optee/optee_ffa.h     | 201 ++++++++
+ drivers/tee/optee/optee_msg.h     | 167 ++-----
+ drivers/tee/optee/optee_private.h |  61 ++-
+ drivers/tee/optee/optee_rpc_cmd.h | 333 ++++++++++++++
+ drivers/tee/optee/rpc.c           | 147 +++++-
+ drivers/tee/optee/shm_pool.c      |  50 ++
+ drivers/tee/optee/shm_pool.h      |   1 +
+ drivers/tee/tee_core.c            |   1 -
+ drivers/tee/tee_shm.c             |  85 +---
+ include/linux/tee_drv.h           |  26 +-
+ 14 files changed, 1710 insertions(+), 417 deletions(-)
+ create mode 100644 drivers/tee/optee/optee_ffa.h
+ create mode 100644 drivers/tee/optee/optee_rpc_cmd.h
+
+diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
+index 21f51fd88b07..c4fe9f0d3bf8 100644
+--- a/drivers/tee/Makefile
++++ b/drivers/tee/Makefile
+@@ -4,3 +4,4 @@ tee-objs +=3D tee_core.o
+ tee-objs +=3D tee_shm.o
+ tee-objs +=3D tee_shm_pool.o
+ obj-$(CONFIG_OPTEE) +=3D optee/
++ccflags-y +=3D -Og
+diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
+index 56263ae3b1d7..57371dc91bba 100644
+--- a/drivers/tee/optee/Makefile
++++ b/drivers/tee/optee/Makefile
+@@ -6,3 +6,4 @@ optee-objs +=3D rpc.o
+ optee-objs +=3D supp.o
+ optee-objs +=3D shm_pool.o
+ optee-objs +=3D device.o
++ccflags-y +=3D -Og
+diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
+index dbed3f480dc0..ac89ab42a43f 100644
+--- a/drivers/tee/optee/call.c
++++ b/drivers/tee/optee/call.c
+@@ -3,16 +3,20 @@
+  * Copyright (c) 2015, Linaro Limited
+  */
+ #include <linux/arm-smccc.h>
++#include <linux/arm-smcccv1_2.h>
++#include <linux/arm_ffa.h>
+ #include <linux/device.h>
+ #include <linux/err.h>
+ #include <linux/errno.h>
+ #include <linux/mm.h>
++#include <linux/scatterlist.h>
+ #include <linux/slab.h>
+ #include <linux/tee_drv.h>
+ #include <linux/types.h>
+ #include <linux/uaccess.h>
+ #include "optee_private.h"
+ #include "optee_smc.h"
++#include "optee_ffa.h"
+=20
+ struct optee_call_waiter {
+ 	struct list_head list_node;
+@@ -122,13 +126,18 @@ static struct optee_session *find_session(struct opt=
ee_context_data *ctxdata,
+  *
+  * Returns return code from secure world, 0 is OK
+  */
+-u32 optee_do_call_with_arg(struct tee_context *ctx, phys_addr_t parg)
++int optee_do_call_with_arg(struct tee_context *ctx, struct tee_shm *arg)
+ {
+ 	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+-	struct optee_call_waiter w;
++	struct optee_call_waiter w =3D { };
+ 	struct optee_rpc_param param =3D { };
+ 	struct optee_call_ctx call_ctx =3D { };
+-	u32 ret;
++	phys_addr_t parg =3D 0;
++	int rc =3D 0;
++
++	rc =3D tee_shm_get_pa(arg, 0, &parg);
++	if (rc)
++		return rc;
+=20
+ 	param.a0 =3D OPTEE_SMC_CALL_WITH_ARG;
+ 	reg_pair_from_64(&param.a1, &param.a2, parg);
+@@ -155,7 +164,7 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, ph=
ys_addr_t parg)
+ 			param.a3 =3D res.a3;
+ 			optee_handle_rpc(ctx, &param, &call_ctx);
+ 		} else {
+-			ret =3D res.a0;
++			rc =3D res.a0;
+ 			break;
+ 		}
+ 	}
+@@ -167,16 +176,15 @@ u32 optee_do_call_with_arg(struct tee_context *ctx, =
phys_addr_t parg)
+ 	 */
+ 	optee_cq_wait_final(&optee->call_queue, &w);
+=20
+-	return ret;
++	return rc;
+ }
+=20
+ static struct tee_shm *get_msg_arg(struct tee_context *ctx, size_t num_pa=
rams,
+-				   struct optee_msg_arg **msg_arg,
+-				   phys_addr_t *msg_parg)
++				   struct optee_msg_arg **msg_arg)
+ {
+-	int rc;
+-	struct tee_shm *shm;
+-	struct optee_msg_arg *ma;
++	int rc =3D 0;
++	struct tee_shm *shm =3D NULL;
++	struct optee_msg_arg *ma =3D NULL;
+=20
+ 	shm =3D tee_shm_alloc(ctx, OPTEE_MSG_GET_ARG_SIZE(num_params),
+ 			    TEE_SHM_MAPPED);
+@@ -189,10 +197,6 @@ static struct tee_shm *get_msg_arg(struct tee_context=
 *ctx, size_t num_params,
+ 		goto out;
+ 	}
+=20
+-	rc =3D tee_shm_get_pa(shm, 0, msg_parg);
+-	if (rc)
+-		goto out;
+-
+ 	memset(ma, 0, OPTEE_MSG_GET_ARG_SIZE(num_params));
+ 	ma->num_params =3D num_params;
+ 	*msg_arg =3D ma;
+@@ -209,15 +213,15 @@ int optee_open_session(struct tee_context *ctx,
+ 		       struct tee_ioctl_open_session_arg *arg,
+ 		       struct tee_param *param)
+ {
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_context_data *ctxdata =3D ctx->data;
+-	int rc;
+-	struct tee_shm *shm;
+-	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
++	struct optee_msg_arg *msg_arg =3D NULL;
+ 	struct optee_session *sess =3D NULL;
++	struct tee_shm *shm =3D NULL;
++	int rc =3D 0;
+=20
+ 	/* +2 for the meta parameters added below */
+-	shm =3D get_msg_arg(ctx, arg->num_params + 2, &msg_arg, &msg_parg);
++	shm =3D get_msg_arg(ctx, arg->num_params + 2, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+=20
+@@ -240,7 +244,8 @@ int optee_open_session(struct tee_context *ctx,
+ 	if (rc)
+ 		goto out;
+=20
+-	rc =3D optee_to_msg_param(msg_arg->params + 2, arg->num_params, param);
++	rc =3D optee->ops->to_msg_param(optee, msg_arg->params + 2,
++				      arg->num_params, param);
+ 	if (rc)
+ 		goto out;
+=20
+@@ -250,7 +255,7 @@ int optee_open_session(struct tee_context *ctx,
+ 		goto out;
+ 	}
+=20
+-	if (optee_do_call_with_arg(ctx, msg_parg)) {
++	if (optee->ops->do_call_with_arg(ctx, shm)) {
+ 		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
+ 		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+ 	}
+@@ -265,7 +270,8 @@ int optee_open_session(struct tee_context *ctx,
+ 		kfree(sess);
+ 	}
+=20
+-	if (optee_from_msg_param(param, arg->num_params, msg_arg->params + 2)) {
++	if (optee->ops->from_msg_param(optee, param, arg->num_params,
++				       msg_arg->params + 2)) {
+ 		arg->ret =3D TEEC_ERROR_COMMUNICATION;
+ 		arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+ 		/* Close session again to avoid leakage */
+@@ -281,12 +287,28 @@ int optee_open_session(struct tee_context *ctx,
+ 	return rc;
+ }
+=20
+-int optee_close_session(struct tee_context *ctx, u32 session)
++int optee_close_session_helper(struct tee_context *ctx, u32 session)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	struct optee_msg_arg *msg_arg =3D NULL;
++	struct tee_shm *shm =3D NULL;
++
++	shm =3D get_msg_arg(ctx, 0, &msg_arg);
++	if (IS_ERR(shm))
++		return PTR_ERR(shm);
++
++	msg_arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
++	msg_arg->session =3D session;
++	optee->ops->do_call_with_arg(ctx, shm);
++
++	tee_shm_free(shm);
++
++	return 0;
++}
++
++static int remove_session(struct tee_context *ctx, u32 session)
+ {
+ 	struct optee_context_data *ctxdata =3D ctx->data;
+-	struct tee_shm *shm;
+-	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
+ 	struct optee_session *sess;
+=20
+ 	/* Check that the session is valid and remove it from the list */
+@@ -299,27 +321,28 @@ int optee_close_session(struct tee_context *ctx, u32=
 session)
+ 		return -EINVAL;
+ 	kfree(sess);
+=20
+-	shm =3D get_msg_arg(ctx, 0, &msg_arg, &msg_parg);
+-	if (IS_ERR(shm))
+-		return PTR_ERR(shm);
++	return 0;
++}
+=20
+-	msg_arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
+-	msg_arg->session =3D session;
+-	optee_do_call_with_arg(ctx, msg_parg);
++int optee_close_session(struct tee_context *ctx, u32 session)
++{
++	int rc =3D remove_session(ctx, session);
+=20
+-	tee_shm_free(shm);
+-	return 0;
++	if (rc)
++		return rc;
++
++	return optee_close_session_helper(ctx, session);
+ }
+=20
+ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_ar=
g *arg,
+ 		      struct tee_param *param)
+ {
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_context_data *ctxdata =3D ctx->data;
+-	struct tee_shm *shm;
+-	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
+-	struct optee_session *sess;
+-	int rc;
++	struct optee_msg_arg *msg_arg =3D NULL;
++	struct optee_session *sess =3D NULL;
++	struct tee_shm *shm =3D NULL;
++	int rc =3D 0;
+=20
+ 	/* Check that the session is valid */
+ 	mutex_lock(&ctxdata->mutex);
+@@ -328,7 +351,7 @@ int optee_invoke_func(struct tee_context *ctx, struct =
tee_ioctl_invoke_arg *arg,
+ 	if (!sess)
+ 		return -EINVAL;
+=20
+-	shm =3D get_msg_arg(ctx, arg->num_params, &msg_arg, &msg_parg);
++	shm =3D get_msg_arg(ctx, arg->num_params, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+ 	msg_arg->cmd =3D OPTEE_MSG_CMD_INVOKE_COMMAND;
+@@ -336,16 +359,18 @@ int optee_invoke_func(struct tee_context *ctx, struc=
t tee_ioctl_invoke_arg *arg,
+ 	msg_arg->session =3D arg->session;
+ 	msg_arg->cancel_id =3D arg->cancel_id;
+=20
+-	rc =3D optee_to_msg_param(msg_arg->params, arg->num_params, param);
++	rc =3D optee->ops->to_msg_param(optee, msg_arg->params, arg->num_params,
++				      param);
+ 	if (rc)
+ 		goto out;
+=20
+-	if (optee_do_call_with_arg(ctx, msg_parg)) {
++	if (optee->ops->do_call_with_arg(ctx, shm)) {
+ 		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
+ 		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+ 	}
+=20
+-	if (optee_from_msg_param(param, arg->num_params, msg_arg->params)) {
++	if (optee->ops->from_msg_param(optee, param, arg->num_params,
++				       msg_arg->params)) {
+ 		msg_arg->ret =3D TEEC_ERROR_COMMUNICATION;
+ 		msg_arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+ 	}
+@@ -359,11 +384,11 @@ int optee_invoke_func(struct tee_context *ctx, struc=
t tee_ioctl_invoke_arg *arg,
+=20
+ int optee_cancel_req(struct tee_context *ctx, u32 cancel_id, u32 session)
+ {
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	struct optee_context_data *ctxdata =3D ctx->data;
+-	struct tee_shm *shm;
+-	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
+-	struct optee_session *sess;
++	struct optee_msg_arg *msg_arg =3D NULL;
++	struct optee_session *sess =3D NULL;
++	struct tee_shm *shm =3D NULL;
+=20
+ 	/* Check that the session is valid */
+ 	mutex_lock(&ctxdata->mutex);
+@@ -372,14 +397,14 @@ int optee_cancel_req(struct tee_context *ctx, u32 ca=
ncel_id, u32 session)
+ 	if (!sess)
+ 		return -EINVAL;
+=20
+-	shm =3D get_msg_arg(ctx, 0, &msg_arg, &msg_parg);
++	shm =3D get_msg_arg(ctx, 0, &msg_arg);
+ 	if (IS_ERR(shm))
+ 		return PTR_ERR(shm);
+=20
+ 	msg_arg->cmd =3D OPTEE_MSG_CMD_CANCEL;
+ 	msg_arg->session =3D session;
+ 	msg_arg->cancel_id =3D cancel_id;
+-	optee_do_call_with_arg(ctx, msg_parg);
++	optee->ops->do_call_with_arg(ctx, shm);
+=20
+ 	tee_shm_free(shm);
+ 	return 0;
+@@ -442,6 +467,16 @@ void optee_disable_shm_cache(struct optee *optee)
+ 	optee_cq_wait_final(&optee->call_queue, &w);
+ }
+=20
++/**
++ * optee_ffa_disable_shm_cache() - Disables caching of some shared memory
++ *                                  allocation in OP-TEE
++ * @optee:	main service struct
++ */
++void optee_ffa_disable_shm_cache(struct optee *optee)
++{
++	BUG();
++}
++
+ #define PAGELIST_ENTRIES_PER_PAGE				\
+ 	((OPTEE_MSG_NONCONTIG_PAGE_SIZE / sizeof(u64)) - 1)
+=20
+@@ -577,11 +612,11 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
+ 		       struct page **pages, size_t num_pages,
+ 		       unsigned long start)
+ {
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	struct optee_msg_arg *msg_arg =3D NULL;
+ 	struct tee_shm *shm_arg =3D NULL;
+-	struct optee_msg_arg *msg_arg;
+-	u64 *pages_list;
+-	phys_addr_t msg_parg;
+-	int rc;
++	u64 *pages_list =3D NULL;
++	int rc =3D 0;
+=20
+ 	if (!num_pages)
+ 		return -EINVAL;
+@@ -594,7 +629,7 @@ int optee_shm_register(struct tee_context *ctx, struct=
 tee_shm *shm,
+ 	if (!pages_list)
+ 		return -ENOMEM;
+=20
+-	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg, &msg_parg);
++	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg);
+ 	if (IS_ERR(shm_arg)) {
+ 		rc =3D PTR_ERR(shm_arg);
+ 		goto out;
+@@ -615,7 +650,7 @@ int optee_shm_register(struct tee_context *ctx, struct=
 tee_shm *shm,
+ 	msg_arg->params->u.tmem.buf_ptr =3D virt_to_phys(pages_list) |
+ 	  (tee_shm_get_page_offset(shm) & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1));
+=20
+-	if (optee_do_call_with_arg(ctx, msg_parg) ||
++	if (optee->ops->do_call_with_arg(ctx, shm) ||
+ 	    msg_arg->ret !=3D TEEC_SUCCESS)
+ 		rc =3D -EINVAL;
+=20
+@@ -627,12 +662,12 @@ int optee_shm_register(struct tee_context *ctx, stru=
ct tee_shm *shm,
+=20
+ int optee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
+ {
+-	struct tee_shm *shm_arg;
+-	struct optee_msg_arg *msg_arg;
+-	phys_addr_t msg_parg;
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	struct optee_msg_arg *msg_arg =3D NULL;
++	struct tee_shm *shm_arg =3D NULL;
+ 	int rc =3D 0;
+=20
+-	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg, &msg_parg);
++	shm_arg =3D get_msg_arg(ctx, 1, &msg_arg);
+ 	if (IS_ERR(shm_arg))
+ 		return PTR_ERR(shm_arg);
+=20
+@@ -641,7 +676,7 @@ int optee_shm_unregister(struct tee_context *ctx, stru=
ct tee_shm *shm)
+ 	msg_arg->params[0].attr =3D OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+ 	msg_arg->params[0].u.rmem.shm_ref =3D (unsigned long)shm;
+=20
+-	if (optee_do_call_with_arg(ctx, msg_parg) ||
++	if (optee->ops->do_call_with_arg(ctx, shm) ||
+ 	    msg_arg->ret !=3D TEEC_SUCCESS)
+ 		rc =3D -EINVAL;
+ 	tee_shm_free(shm_arg);
+@@ -663,3 +698,166 @@ int optee_shm_unregister_supp(struct tee_context *ct=
x, struct tee_shm *shm)
+ {
+ 	return 0;
+ }
++
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++static int optee_ffa_yielding_call(struct tee_context *ctx, u32 w3, u32 w=
4,
++				    u32 w5)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	struct arm_smcccv1_2_return ret =3D { };
++	const u32 dst =3D optee->ffa.dst;
++	struct optee_call_waiter w;
++	u32 w6 =3D 0;
++	u32 w7 =3D 0;
++	int rc =3D 0;
++
++	/* Initialize waiter */
++	optee_cq_wait_init(&optee->call_queue, &w);
++	while (true) {
++		ret =3D optee->ffa.ops->sync_msg_send(dst, w3, w4, w5, w6, w7);
++
++		if (ret.arg0) {
++			pr_err("ret.arg0 %d\n", (int)ret.arg0);
++			rc =3D -EIO;
++			goto done;
++		}
++
++		switch ((int)ret.arg3) {
++		case FFA_SUCCESS:
++			break;
++		case FFA_BUSY:
++			if (w3 =3D=3D OPTEE_FFA_YIELDING_CALL_RESUME) {
++				pr_err("err OPTEE_FFA_YIELDING_CALL_RESUME\n");
++				rc =3D -EIO;
++				goto done;
++			}
++
++			/*
++			 * Out of threads in secure world, wait for a thread
++			 * become available.
++			 */
++			optee_cq_wait_for_completion(&optee->call_queue, &w);
++			continue;
++		default:
++			pr_err("ret.arg3 0x%llx\n", (u64)ret.arg3);
++			rc =3D -EIO;
++			goto done;
++		}
++
++		if (ret.arg4 =3D=3D OPTEE_FFA_YIELDING_CALL_RETURN_DONE)
++			goto done;
++
++		might_sleep();
++		w4 =3D ret.arg4;
++		w5 =3D ret.arg5;
++		w6 =3D ret.arg6;
++		optee_handle_ffa_rpc(ctx, &w4, &w5, &w6);
++		w3 =3D OPTEE_FFA_YIELDING_CALL_RESUME;
++		w7 =3D ret.arg7;
++	}
++done:
++
++	/*
++	 * We're done with our thread in secure world, if there's any
++	 * thread waiters wake up one.
++	 */
++	optee_cq_wait_final(&optee->call_queue, &w);
++
++	return rc;
++}
++
++int optee_ffa_do_call_with_arg(struct tee_context *ctx, struct tee_shm *s=
hm)
++{
++	if (shm->offset)
++		return -EINVAL;
++	return optee_ffa_yielding_call(ctx, OPTEE_FFA_YIELDING_CALL_WITH_ARG,
++				       shm->sec_world_id,
++				       shm->sec_world_id >> 32);
++}
++
++int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
++			    struct page **pages, size_t num_pages,
++			    unsigned long start)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	u64 global_handle =3D 0;
++	u32 rc =3D 0;
++	struct sg_table sgt;
++	struct ffa_mem_region_attributes mem_attr =3D {
++		.receiver =3D optee->ffa.dst,
++		.attrs =3D FFA_MEM_RW,
++	};
++
++	rc =3D check_mem_type(start, num_pages);
++	if (rc)
++		return rc;
++
++	sg_alloc_table_from_pages(&sgt, pages,
++			      num_pages, 0,
++			      num_pages * 4096, GFP_KERNEL);
++
++	rc =3D optee->ffa.ops->mem_share(0, 0, &mem_attr, 1, sgt.sgl, sgt.nents,
++		&global_handle, true);
++	if (rc) {
++		if (rc =3D=3D FFA_NO_MEMORY)
++			return -ENOMEM;
++		return -EINVAL;
++	}
++
++	rc =3D optee_shm_add_ffa_handle(optee, shm, global_handle);
++	if (rc) {
++		optee->ffa.ops->mem_reclaim(global_handle, 0);
++		return rc;
++	}
++
++	shm->sec_world_id =3D global_handle;
++
++	return 0;
++}
++
++int optee_ffa_shm_unregister(struct tee_context *ctx, struct tee_shm *shm=
)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	u64 global_handle =3D shm->sec_world_id;
++	int rc =3D 0;
++
++	optee_shm_rem_ffa_handle(optee, global_handle);
++	shm->sec_world_id =3D 0;
++
++	rc =3D optee_ffa_yielding_call(ctx,
++				     OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM,
++				     global_handle, global_handle >> 32);
++	if (rc)
++		pr_err("OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM id 0x%llx rc %d\n",
++		       global_handle, rc);
++
++	rc =3D optee->ffa.ops->mem_reclaim(global_handle, 0);
++	if (rc)
++		pr_err("mem_reclain: %d", rc);
++
++	return rc;
++}
++
++int optee_ffa_shm_unregister_supp(struct tee_context *ctx,
++				   struct tee_shm *shm)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	int rc =3D 0;
++
++	/*
++	 * We're skipping the OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM call
++	 * since this is OP-TEE freeing via RPC so it has already retired
++	 * this ID.
++	 */
++
++	rc =3D optee->ffa.ops->mem_reclaim(shm->sec_world_id, 0);
++	if (rc)
++		pr_err("mem_reclain: %d", rc);
++
++	optee_shm_rem_ffa_handle(optee, shm->sec_world_id);
++
++	shm->sec_world_id =3D 0;
++
++	return rc;
++}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
+diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
+index b830e0a87fba..4178ae7f914a 100644
+--- a/drivers/tee/optee/core.c
++++ b/drivers/tee/optee/core.c
+@@ -6,6 +6,8 @@
+ #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+=20
+ #include <linux/arm-smccc.h>
++#include <linux/arm-smcccv1_2.h>
++#include <linux/arm_ffa.h>
+ #include <linux/errno.h>
+ #include <linux/io.h>
+ #include <linux/module.h>
+@@ -19,12 +21,157 @@
+ #include <linux/uaccess.h>
+ #include "optee_private.h"
+ #include "optee_smc.h"
++#include "optee_ffa.h"
+ #include "shm_pool.h"
+=20
+ #define DRIVER_NAME "optee"
++#define SUPPORTED_OPTEE_PARTITIONS 1
+=20
+ #define OPTEE_SHM_NUM_PRIV_PAGES	CONFIG_OPTEE_SHM_NUM_PRIV_PAGES
+=20
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++struct shm_rhash {
++	struct tee_shm *shm;
++	u64 global_id;
++	struct rhash_head linkage;
++};
++
++static void rh_free_fn(void *ptr, void *arg)
++{
++	kfree(ptr);
++}
++
++static const struct rhashtable_params shm_rhash_params =3D {
++	.head_offset =3D offsetof(struct shm_rhash, linkage),
++	.key_len     =3D sizeof(u64),
++	.key_offset  =3D offsetof(struct shm_rhash, global_id),
++	.automatic_shrinking =3D true,
++};
++
++struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee, u64 global=
_id)
++{
++	struct shm_rhash *r =3D NULL;
++	struct tee_shm *shm =3D NULL;
++
++	mutex_lock(&optee->ffa.mutex);
++	r =3D rhashtable_lookup_fast(&optee->ffa.global_ids, &global_id,
++				   shm_rhash_params);
++	if (r)
++		shm =3D r->shm;
++	mutex_unlock(&optee->ffa.mutex);
++
++	return shm;
++}
++
++int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm *shm,
++			      u64 global_id)
++{
++	struct shm_rhash *r =3D NULL;
++	int rc =3D 0;
++
++	r =3D kmalloc(sizeof(*r), GFP_KERNEL);
++	if (!r)
++		return -ENOMEM;
++	r->shm =3D shm;
++	r->global_id =3D global_id;
++
++	mutex_lock(&optee->ffa.mutex);
++	rc =3D rhashtable_lookup_insert_fast(&optee->ffa.global_ids, &r->linkage=
,
++					   shm_rhash_params);
++	mutex_unlock(&optee->ffa.mutex);
++
++	if (rc)
++		kfree(r);
++
++	return rc;
++}
++
++int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id)
++{
++	struct shm_rhash *r =3D NULL;
++	int rc =3D -ENOENT;
++
++	mutex_lock(&optee->ffa.mutex);
++	r =3D rhashtable_lookup_fast(&optee->ffa.global_ids, &global_id,
++				   shm_rhash_params);
++	if (r) {
++		rc =3D rhashtable_remove_fast(&optee->ffa.global_ids,
++					    &r->linkage, shm_rhash_params);
++		if (!rc)
++			kfree(r);
++	}
++	mutex_unlock(&optee->ffa.mutex);
++
++	return rc;
++}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
++
++static void from_msg_param_value(struct tee_param *p, u32 attr,
++				 const struct optee_msg_param *mp)
++{
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
++	p->u.value.a =3D mp->u.value.a;
++	p->u.value.b =3D mp->u.value.b;
++	p->u.value.c =3D mp->u.value.c;
++}
++
++static int from_msg_param_tmp_mem(struct tee_param *p, u32 attr,
++				  const struct optee_msg_param *mp)
++{
++	struct tee_shm *shm =3D NULL;
++	phys_addr_t pa =3D 0;
++	int rc =3D 0;
++
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
++	p->u.memref.size =3D mp->u.tmem.size;
++	shm =3D (struct tee_shm *)(unsigned long)mp->u.tmem.shm_ref;
++	if (!shm) {
++		p->u.memref.shm_offs =3D 0;
++		p->u.memref.shm =3D NULL;
++		return 0;
++	}
++
++	rc =3D tee_shm_get_pa(shm, 0, &pa);
++	if (rc)
++		return rc;
++
++	p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
++	p->u.memref.shm =3D shm;
++
++	/* Check that the memref is covered by the shm object */
++	if (p->u.memref.size) {
++		size_t o =3D p->u.memref.shm_offs +
++			   p->u.memref.size - 1;
++
++		rc =3D tee_shm_get_pa(shm, o, NULL);
++		if (rc)
++			return rc;
++	}
++
++	return 0;
++}
++
++static void from_msg_param_reg_mem(struct tee_param *p, u32 attr,
++				   const struct optee_msg_param *mp)
++{
++	struct tee_shm *shm =3D NULL;
++
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
++	p->u.memref.size =3D mp->u.rmem.size;
++	shm =3D (struct tee_shm *)(unsigned long) mp->u.rmem.shm_ref;
++
++	if (shm) {
++		p->u.memref.shm_offs =3D mp->u.rmem.offs;
++		p->u.memref.shm =3D shm;
++	} else {
++		p->u.memref.shm_offs =3D 0;
++		p->u.memref.shm =3D NULL;
++	}
++}
++
+ /**
+  * optee_from_msg_param() - convert from OPTEE_MSG parameters to
+  *			    struct tee_param
+@@ -33,13 +180,12 @@
+  * @msg_params:	OPTEE_MSG parameters
+  * Returns 0 on success or <0 on failure
+  */
+-int optee_from_msg_param(struct tee_param *params, size_t num_params,
+-			 const struct optee_msg_param *msg_params)
++static int optee_from_msg_param(struct optee *optee, struct tee_param *pa=
rams,
++				size_t num_params,
++				const struct optee_msg_param *msg_params)
+ {
+-	int rc;
+-	size_t n;
+-	struct tee_shm *shm;
+-	phys_addr_t pa;
++	size_t n =3D 0;
++	int rc =3D 0;
+=20
+ 	for (n =3D 0; n < num_params; n++) {
+ 		struct tee_param *p =3D params + n;
+@@ -54,58 +200,19 @@ int optee_from_msg_param(struct tee_param *params, si=
ze_t num_params,
+ 		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
+-			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT +
+-				  attr - OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+-			p->u.value.a =3D mp->u.value.a;
+-			p->u.value.b =3D mp->u.value.b;
+-			p->u.value.c =3D mp->u.value.c;
++			from_msg_param_value(p, attr, mp);
+ 			break;
+ 		case OPTEE_MSG_ATTR_TYPE_TMEM_INPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_TMEM_INOUT:
+-			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
+-				  attr - OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+-			p->u.memref.size =3D mp->u.tmem.size;
+-			shm =3D (struct tee_shm *)(unsigned long)
+-				mp->u.tmem.shm_ref;
+-			if (!shm) {
+-				p->u.memref.shm_offs =3D 0;
+-				p->u.memref.shm =3D NULL;
+-				break;
+-			}
+-			rc =3D tee_shm_get_pa(shm, 0, &pa);
++			rc =3D from_msg_param_tmp_mem(p, attr, mp);
+ 			if (rc)
+ 				return rc;
+-			p->u.memref.shm_offs =3D mp->u.tmem.buf_ptr - pa;
+-			p->u.memref.shm =3D shm;
+-
+-			/* Check that the memref is covered by the shm object */
+-			if (p->u.memref.size) {
+-				size_t o =3D p->u.memref.shm_offs +
+-					   p->u.memref.size - 1;
+-
+-				rc =3D tee_shm_get_pa(shm, o, NULL);
+-				if (rc)
+-					return rc;
+-			}
+ 			break;
+ 		case OPTEE_MSG_ATTR_TYPE_RMEM_INPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT:
+ 		case OPTEE_MSG_ATTR_TYPE_RMEM_INOUT:
+-			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
+-				  attr - OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+-			p->u.memref.size =3D mp->u.rmem.size;
+-			shm =3D (struct tee_shm *)(unsigned long)
+-				mp->u.rmem.shm_ref;
+-
+-			if (!shm) {
+-				p->u.memref.shm_offs =3D 0;
+-				p->u.memref.shm =3D NULL;
+-				break;
+-			}
+-			p->u.memref.shm_offs =3D mp->u.rmem.offs;
+-			p->u.memref.shm =3D shm;
+-
++			from_msg_param_reg_mem(p, attr, mp);
+ 			break;
+=20
+ 		default:
+@@ -115,11 +222,21 @@ int optee_from_msg_param(struct tee_param *params, s=
ize_t num_params,
+ 	return 0;
+ }
+=20
++static void to_msg_param_value(struct optee_msg_param *mp,
++			       const struct tee_param *p)
++{
++	mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
++		   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
++	mp->u.value.a =3D p->u.value.a;
++	mp->u.value.b =3D p->u.value.b;
++	mp->u.value.c =3D p->u.value.c;
++}
++
+ static int to_msg_param_tmp_mem(struct optee_msg_param *mp,
+ 				const struct tee_param *p)
+ {
+-	int rc;
+-	phys_addr_t pa;
++	phys_addr_t pa =3D 0;
++	int rc =3D 0;
+=20
+ 	mp->attr =3D OPTEE_MSG_ATTR_TYPE_TMEM_INPUT + p->attr -
+ 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
+@@ -162,11 +279,12 @@ static int to_msg_param_reg_mem(struct optee_msg_par=
am *mp,
+  * @params:	subsystem itnernal parameter representation
+  * Returns 0 on success or <0 on failure
+  */
+-int optee_to_msg_param(struct optee_msg_param *msg_params, size_t num_par=
ams,
+-		       const struct tee_param *params)
++static int optee_to_msg_param(struct optee *optee,
++			      struct optee_msg_param *msg_params,
++			      size_t num_params, const struct tee_param *params)
+ {
+-	int rc;
+-	size_t n;
++	size_t n =3D 0;
++	int rc =3D 0;
+=20
+ 	for (n =3D 0; n < num_params; n++) {
+ 		const struct tee_param *p =3D params + n;
+@@ -180,11 +298,7 @@ int optee_to_msg_param(struct optee_msg_param *msg_pa=
rams, size_t num_params,
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
+-			mp->attr =3D OPTEE_MSG_ATTR_TYPE_VALUE_INPUT + p->attr -
+-				   TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+-			mp->u.value.a =3D p->u.value.a;
+-			mp->u.value.b =3D p->u.value.b;
+-			mp->u.value.c =3D p->u.value.c;
++			to_msg_param_value(mp, p);
+ 			break;
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
+ 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
+@@ -203,6 +317,137 @@ int optee_to_msg_param(struct optee_msg_param *msg_p=
arams, size_t num_params,
+ 	return 0;
+ }
+=20
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++static void from_msg_param_ffa_mem(struct optee *optee, struct tee_param =
*p,
++				    u32 attr, const struct optee_msg_param *mp)
++{
++	struct tee_shm *shm =3D NULL;
++	u64 offs_high =3D 0;
++	u64 offs_low =3D 0;
++
++	p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT +
++		  attr - OPTEE_MSG_ATTR_TYPE_SMEM_INPUT;
++	p->u.memref.size =3D mp->u.smem.size;
++	shm =3D optee_shm_from_ffa_handle(optee, mp->u.smem.global_id);
++	p->u.memref.shm =3D shm;
++	if (shm) {
++		offs_low =3D mp->u.smem.offs_low;
++		offs_high =3D mp->u.smem.offs_high;
++	}
++	p->u.memref.shm_offs =3D offs_low | offs_high << 32;
++}
++
++/**
++ * optee_ffa_from_msg_param() - convert from OPTEE_MSG parameters to
++ *				 struct tee_param
++ * @params:	subsystem internal parameter representation
++ * @num_params:	number of elements in the parameter arrays
++ * @msg_params:	OPTEE_MSG parameters
++ * Returns 0 on success or <0 on failure
++ */
++static int optee_ffa_from_msg_param(struct optee *optee,
++				     struct tee_param *params,
++				     size_t num_params,
++				     const struct optee_msg_param *msg_params)
++{
++	size_t n =3D 0;
++
++	for (n =3D 0; n < num_params; n++) {
++		struct tee_param *p =3D params + n;
++		const struct optee_msg_param *mp =3D msg_params + n;
++		u32 attr =3D mp->attr & OPTEE_MSG_ATTR_TYPE_MASK;
++
++		switch (attr) {
++		case OPTEE_MSG_ATTR_TYPE_NONE:
++			p->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
++			memset(&p->u, 0, sizeof(p->u));
++			break;
++		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
++		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
++		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
++			from_msg_param_value(p, attr, mp);
++			break;
++		case OPTEE_MSG_ATTR_TYPE_SMEM_INPUT:
++		case OPTEE_MSG_ATTR_TYPE_SMEM_OUTPUT:
++		case OPTEE_MSG_ATTR_TYPE_SMEM_INOUT:
++			from_msg_param_ffa_mem(optee, p, attr, mp);
++			break;
++		default:
++			return -EINVAL;
++		}
++	}
++	return 0;
++}
++
++static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
++				 const struct tee_param *p)
++{
++	struct tee_shm *shm =3D p->u.memref.shm;
++
++	mp->attr =3D OPTEE_MSG_ATTR_TYPE_SMEM_INPUT + p->attr -
++		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
++
++	if (shm) {
++		u64 shm_offs =3D p->u.memref.shm_offs;
++
++		mp->u.smem.internal_offs =3D shm->offset;
++
++		mp->u.smem.offs_low =3D shm_offs;
++		mp->u.smem.offs_high =3D shm_offs >> 32;
++		/* Check that the entire offset could be stored. */
++		if (mp->u.smem.offs_high !=3D shm_offs >> 32)
++			return -EINVAL;
++
++		mp->u.smem.global_id =3D shm->sec_world_id;
++	} else {
++		memset(&mp->u, 0, sizeof(mp->u));
++	}
++	mp->u.smem.size =3D p->u.memref.size;
++	return 0;
++}
++
++/**
++ * optee_to_msg_param() - convert from struct tee_params to OPTEE_MSG par=
ameters
++ * @msg_params:	OPTEE_MSG parameters
++ * @num_params:	number of elements in the parameter arrays
++ * @params:	subsystem itnernal parameter representation
++ * Returns 0 on success or <0 on failure
++ */
++static int optee_ffa_to_msg_param(struct optee *optee,
++				   struct optee_msg_param *msg_params,
++				   size_t num_params,
++				   const struct tee_param *params)
++{
++	size_t n;
++
++	for (n =3D 0; n < num_params; n++) {
++		const struct tee_param *p =3D params + n;
++		struct optee_msg_param *mp =3D msg_params + n;
++
++		switch (p->attr) {
++		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
++			mp->attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
++			memset(&mp->u, 0, sizeof(mp->u));
++			break;
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
++			to_msg_param_value(mp, p);
++			break;
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
++		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
++			if (to_msg_param_ffa_mem(mp, p))
++				return -EINVAL;
++			break;
++		default:
++			return -EINVAL;
++		}
++	}
++	return 0;
++}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
++
+ static void optee_get_version(struct tee_device *teedev,
+ 			      struct tee_ioctl_version_data *vers)
+ {
+@@ -218,6 +463,17 @@ static void optee_get_version(struct tee_device *teed=
ev,
+ 	*vers =3D v;
+ }
+=20
++static void optee_ffa_get_version(struct tee_device *teedev,
++				   struct tee_ioctl_version_data *vers)
++{
++	struct tee_ioctl_version_data v =3D {
++		.impl_id =3D TEE_IMPL_ID_OPTEE,
++		.impl_caps =3D TEE_OPTEE_CAP_TZ,
++		.gen_caps =3D TEE_GEN_CAP_GP | TEE_GEN_CAP_REG_MEM,
++	};
++	*vers =3D v;
++}
++
+ static int optee_open(struct tee_context *ctx)
+ {
+ 	struct optee_context_data *ctxdata;
+@@ -250,57 +506,41 @@ static int optee_open(struct tee_context *ctx)
+ 	return 0;
+ }
+=20
+-static void optee_release(struct tee_context *ctx)
++static void optee_release_helper(struct tee_context *ctx,
++				 int (*close_session)(struct tee_context *ctx,
++						      u32 session))
+ {
+ 	struct optee_context_data *ctxdata =3D ctx->data;
+-	struct tee_device *teedev =3D ctx->teedev;
+-	struct optee *optee =3D tee_get_drvdata(teedev);
+-	struct tee_shm *shm;
+-	struct optee_msg_arg *arg =3D NULL;
+-	phys_addr_t parg;
+ 	struct optee_session *sess;
+ 	struct optee_session *sess_tmp;
+=20
+ 	if (!ctxdata)
+ 		return;
+=20
+-	shm =3D tee_shm_alloc(ctx, sizeof(struct optee_msg_arg), TEE_SHM_MAPPED)=
;
+-	if (!IS_ERR(shm)) {
+-		arg =3D tee_shm_get_va(shm, 0);
+-		/*
+-		 * If va2pa fails for some reason, we can't call into
+-		 * secure world, only free the memory. Secure OS will leak
+-		 * sessions and finally refuse more sessions, but we will
+-		 * at least let normal world reclaim its memory.
+-		 */
+-		if (!IS_ERR(arg))
+-			if (tee_shm_va2pa(shm, arg, &parg))
+-				arg =3D NULL; /* prevent usage of parg below */
+-	}
+-
+ 	list_for_each_entry_safe(sess, sess_tmp, &ctxdata->sess_list,
+ 				 list_node) {
+ 		list_del(&sess->list_node);
+-		if (!IS_ERR_OR_NULL(arg)) {
+-			memset(arg, 0, sizeof(*arg));
+-			arg->cmd =3D OPTEE_MSG_CMD_CLOSE_SESSION;
+-			arg->session =3D sess->session_id;
+-			optee_do_call_with_arg(ctx, parg);
+-		}
++		close_session(ctx, sess->session_id);
+ 		kfree(sess);
+ 	}
+ 	kfree(ctxdata);
++	ctx->data =3D NULL;
++}
+=20
+-	if (!IS_ERR(shm))
+-		tee_shm_free(shm);
++static void optee_release(struct tee_context *ctx)
++{
++	optee_release_helper(ctx, optee_close_session_helper);
++}
+=20
+-	ctx->data =3D NULL;
++static void optee_release_supp(struct tee_context *ctx)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+=20
+-	if (teedev =3D=3D optee->supp_teedev)
+-		optee_supp_release(&optee->supp);
++	optee_release_helper(ctx, optee_close_session_helper);
++	optee_supp_release(&optee->supp);
+ }
+=20
+-static const struct tee_driver_ops optee_ops =3D {
++static const struct tee_driver_ops optee_legacy_clnt_ops =3D {
+ 	.get_version =3D optee_get_version,
+ 	.open =3D optee_open,
+ 	.release =3D optee_release,
+@@ -312,29 +552,36 @@ static const struct tee_driver_ops optee_ops =3D {
+ 	.shm_unregister =3D optee_shm_unregister,
+ };
+=20
+-static const struct tee_desc optee_desc =3D {
+-	.name =3D DRIVER_NAME "-clnt",
+-	.ops =3D &optee_ops,
++static const struct tee_desc optee_legacy_clnt_desc =3D {
++	.name =3D DRIVER_NAME "legacy-clnt",
++	.ops =3D &optee_legacy_clnt_ops,
+ 	.owner =3D THIS_MODULE,
+ };
+=20
+-static const struct tee_driver_ops optee_supp_ops =3D {
++static const struct tee_driver_ops optee_legacy_supp_ops =3D {
+ 	.get_version =3D optee_get_version,
+ 	.open =3D optee_open,
+-	.release =3D optee_release,
++	.release =3D optee_release_supp,
+ 	.supp_recv =3D optee_supp_recv,
+ 	.supp_send =3D optee_supp_send,
+ 	.shm_register =3D optee_shm_register_supp,
+ 	.shm_unregister =3D optee_shm_unregister_supp,
+ };
+=20
+-static const struct tee_desc optee_supp_desc =3D {
+-	.name =3D DRIVER_NAME "-supp",
+-	.ops =3D &optee_supp_ops,
++static const struct tee_desc optee_legacy_supp_desc =3D {
++	.name =3D DRIVER_NAME "legacy-supp",
++	.ops =3D &optee_legacy_supp_ops,
+ 	.owner =3D THIS_MODULE,
+ 	.flags =3D TEE_DESC_PRIVILEGED,
+ };
+=20
++static const struct optee_ops optee_legacy_ops =3D {
++	.do_call_with_arg =3D optee_do_call_with_arg,
++	.to_msg_param =3D optee_to_msg_param,
++	.from_msg_param =3D optee_from_msg_param,
++};
++
++
+ static bool optee_msg_api_uid_is_optee_api(optee_invoke_fn *invoke_fn)
+ {
+ 	struct arm_smccc_res res;
+@@ -534,16 +781,9 @@ static void optee_smccc_hvc(unsigned long a0, unsigne=
d long a1,
+ 	arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
+ }
+=20
+-static optee_invoke_fn *get_invoke_func(struct device_node *np)
++static optee_invoke_fn *get_invoke_func(const char *method)
+ {
+-	const char *method;
+=20
+-	pr_info("probing for conduit method from DT.\n");
+-
+-	if (of_property_read_string(np, "method", &method)) {
+-		pr_warn("missing \"method\" property\n");
+-		return ERR_PTR(-ENXIO);
+-	}
+=20
+ 	if (!strcmp("hvc", method))
+ 		return optee_smccc_hvc;
+@@ -554,7 +794,7 @@ static optee_invoke_fn *get_invoke_func(struct device_=
node *np)
+ 	return ERR_PTR(-EINVAL);
+ }
+=20
+-static struct optee *optee_probe(struct device_node *np)
++static struct optee *optee_probe_legacy(const char *method)
+ {
+ 	optee_invoke_fn *invoke_fn;
+ 	struct tee_shm_pool *pool =3D ERR_PTR(-EINVAL);
+@@ -564,7 +804,7 @@ static struct optee *optee_probe(struct device_node *n=
p)
+ 	u32 sec_caps;
+ 	int rc;
+=20
+-	invoke_fn =3D get_invoke_func(np);
++	invoke_fn =3D get_invoke_func(method);
+ 	if (IS_ERR(invoke_fn))
+ 		return (void *)invoke_fn;
+=20
+@@ -606,17 +846,18 @@ static struct optee *optee_probe(struct device_node =
*np)
+ 		goto err;
+ 	}
+=20
++	optee->ops =3D &optee_legacy_ops;
+ 	optee->invoke_fn =3D invoke_fn;
+ 	optee->sec_caps =3D sec_caps;
+=20
+-	teedev =3D tee_device_alloc(&optee_desc, NULL, pool, optee);
++	teedev =3D tee_device_alloc(&optee_legacy_clnt_desc, NULL, pool, optee);
+ 	if (IS_ERR(teedev)) {
+ 		rc =3D PTR_ERR(teedev);
+ 		goto err;
+ 	}
+ 	optee->teedev =3D teedev;
+=20
+-	teedev =3D tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
++	teedev =3D tee_device_alloc(&optee_legacy_supp_desc, NULL, pool, optee);
+ 	if (IS_ERR(teedev)) {
+ 		rc =3D PTR_ERR(teedev);
+ 		goto err;
+@@ -662,6 +903,266 @@ static struct optee *optee_probe(struct device_node =
*np)
+ 	return ERR_PTR(rc);
+ }
+=20
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++static bool optee_ffa_api_is_compatbile(struct ffa_ops *ffa_ops, u32 dst)
++{
++	struct arm_smcccv1_2_return ret =3D { };
++
++	ret =3D ffa_ops->sync_msg_send(dst, OPTEE_FFA_GET_API_VERSION,
++				     0, 0, 0, 0);
++	if (ret.arg0 !=3D FFA_SUCCESS) {
++		pr_err("Unexpected return fid 0x%llx", ret.arg0);
++		return false;
++	}
++	if (ret.arg3 !=3D OPTEE_FFA_VERSION_MAJOR ||
++	    ret.arg4 < OPTEE_FFA_VERSION_MINOR) {
++		pr_err("Incompatible OP-TEE API version %llu.%llu",
++		       ret.arg3, ret.arg4);
++		return false;
++	}
++
++	ret =3D ffa_ops->sync_msg_send(dst, OPTEE_FFA_GET_OS_VERSION,
++				     0, 0, 0, 0);
++	if (ret.arg0) {
++		pr_err("Unexpected error 0x%llx", ret.arg0);
++		return false;
++	}
++	if (ret.arg5)
++		pr_info("revision %llu.%llu (%08llx)",
++			ret.arg3, ret.arg4, ret.arg5);
++	else
++		pr_info("revision %llu.%llu", ret.arg3, ret.arg4);
++
++	return true;
++}
++
++static bool optee_ffa_exchange_caps(struct ffa_ops *ffa_ops, u32 dst,
++				     u32 *sec_caps)
++{
++	struct arm_smcccv1_2_return ret =3D { };
++
++	ret =3D ffa_ops->sync_msg_send(dst, OPTEE_FFA_EXCHANGE_CAPABILITIES,
++				     0, 0, 0, 0);
++	if (ret.arg0) {
++		pr_err("Unexpected error 0x%llx", ret.arg0);
++		return false;
++	}
++
++	*sec_caps =3D 0;
++
++	return true;
++}
++
++static struct tee_shm_pool *optee_ffa_config_dyn_shm(void)
++{
++	struct tee_shm_pool_mgr *priv_mgr;
++	struct tee_shm_pool_mgr *dmabuf_mgr;
++	void *rc;
++
++	rc =3D optee_ffa_shm_pool_alloc_pages();
++	if (IS_ERR(rc))
++		return rc;
++	priv_mgr =3D rc;
++
++	rc =3D optee_ffa_shm_pool_alloc_pages();
++	if (IS_ERR(rc)) {
++		tee_shm_pool_mgr_destroy(priv_mgr);
++		return rc;
++	}
++	dmabuf_mgr =3D rc;
++
++	rc =3D tee_shm_pool_alloc(priv_mgr, dmabuf_mgr);
++	if (IS_ERR(rc)) {
++		tee_shm_pool_mgr_destroy(priv_mgr);
++		tee_shm_pool_mgr_destroy(dmabuf_mgr);
++	}
++
++	return rc;
++}
++
++static const struct tee_driver_ops optee_ffa_clnt_ops =3D {
++	.get_version =3D optee_ffa_get_version,
++	.open =3D optee_open,
++	.release =3D optee_release,
++	.open_session =3D optee_open_session,
++	.close_session =3D optee_close_session,
++	.invoke_func =3D optee_invoke_func,
++	.cancel_req =3D optee_cancel_req,
++	.shm_register =3D optee_ffa_shm_register,
++	.shm_unregister =3D optee_ffa_shm_unregister,
++};
++
++static const struct tee_desc optee_ffa_clnt_desc =3D {
++	.name =3D DRIVER_NAME "ffa-clnt",
++	.ops =3D &optee_ffa_clnt_ops,
++	.owner =3D THIS_MODULE,
++};
++
++static const struct tee_driver_ops optee_ffa_supp_ops =3D {
++	.get_version =3D optee_ffa_get_version,
++	.open =3D optee_open,
++	.release =3D optee_release_supp,
++	.supp_recv =3D optee_supp_recv,
++	.supp_send =3D optee_supp_send,
++	.shm_register =3D optee_ffa_shm_register, /* same as for clnt ops */
++	.shm_unregister =3D optee_ffa_shm_unregister_supp,
++};
++
++static const struct tee_desc optee_ffa_supp_desc =3D {
++	.name =3D DRIVER_NAME "ffa-supp",
++	.ops =3D &optee_ffa_supp_ops,
++	.owner =3D THIS_MODULE,
++	.flags =3D TEE_DESC_PRIVILEGED,
++};
++
++static const struct optee_ops optee_ffa_ops =3D {
++	.do_call_with_arg =3D optee_ffa_do_call_with_arg,
++	.to_msg_param =3D optee_ffa_to_msg_param,
++	.from_msg_param =3D optee_ffa_from_msg_param,
++};
++
++static struct optee *optee_probe_ffa(void)
++{
++	struct tee_device *teedev =3D NULL;
++	struct ffa_ops *ffa_ops =3D NULL;
++	struct optee *optee =3D NULL;
++	struct ffa_partition_info *partition_info =3D NULL;
++	u32 ffa_dst =3D 0;
++	u32 sec_caps =3D 0;
++	int count =3D 0;
++	int rc =3D 0;
++
++	ffa_ops =3D get_ffa_ops();
++	if (!ffa_ops) {
++		pr_warn("failed \"method\" init: ffa\n");
++		return ERR_PTR(-ENOENT);
++	}
++	/* Use OPTEE UUID to retrieve partition ID. */
++        count =3D ffa_ops->partition_info_get(OPTEE_MSG_OS_OPTEE_UUID_0,
++					     OPTEE_MSG_OS_OPTEE_UUID_1,
++					     OPTEE_MSG_OS_OPTEE_UUID_2,
++					     OPTEE_MSG_OS_OPTEE_UUID_3,
++					     &partition_info);
++
++	/* If count is negative propergate the error code. */
++	if (count < 0) {
++		return ERR_PTR(count);
++	}
++	/*
++	 * If the function returned sucessfully we must ensure to free the
++	 * allocated memory before exiting.
++	 */
++
++	/* Check only a single patition is found.*/
++	/* TODO: Add support for dealing with multiple partitions. */
++	if (count > SUPPORTED_OPTEE_PARTITIONS) {
++		kfree(partition_info);
++		return ERR_PTR(-EINVAL);
++	}
++	ffa_dst =3D partition_info[0].id;
++	kfree(partition_info);
++
++	if (!optee_ffa_api_is_compatbile(ffa_ops, ffa_dst))
++		return ERR_PTR(-EINVAL);
++
++	if (!optee_ffa_exchange_caps(ffa_ops, ffa_dst, &sec_caps))
++		return ERR_PTR(-EINVAL);
++
++	optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
++	if (!optee) {
++		rc =3D -ENOMEM;
++		goto err;
++	}
++	optee->pool =3D optee_ffa_config_dyn_shm();
++	if (IS_ERR(optee->pool)) {
++		rc =3D PTR_ERR(optee->pool);
++		optee->pool =3D NULL;
++		goto err;
++	}
++
++	optee->ops =3D &optee_ffa_ops;
++	optee->ffa.ops =3D ffa_ops;
++	optee->ffa.dst =3D ffa_dst;
++	optee->sec_caps =3D sec_caps;
++
++	teedev =3D tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
++				  optee);
++	if (IS_ERR(teedev)) {
++		rc =3D PTR_ERR(teedev);
++		goto err;
++	}
++	optee->teedev =3D teedev;
++
++	teedev =3D tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
++				  optee);
++	if (IS_ERR(teedev)) {
++		rc =3D PTR_ERR(teedev);
++		goto err;
++	}
++	optee->supp_teedev =3D teedev;
++
++	rc =3D tee_device_register(optee->teedev);
++	if (rc)
++		goto err;
++
++	rc =3D tee_device_register(optee->supp_teedev);
++	if (rc)
++		goto err;
++
++	rc =3D rhashtable_init(&optee->ffa.global_ids, &shm_rhash_params);
++	if (rc)
++		goto err;
++	mutex_init(&optee->ffa.mutex);
++	mutex_init(&optee->call_queue.mutex);
++	INIT_LIST_HEAD(&optee->call_queue.waiters);
++	optee_wait_queue_init(&optee->wait_queue);
++	optee_supp_init(&optee->supp);
++
++	return optee;
++err:
++	/*
++	 * tee_device_unregister() is safe to call even if the
++	 * devices hasn't been registered with
++	 * tee_device_register() yet.
++	 */
++	tee_device_unregister(optee->supp_teedev);
++	tee_device_unregister(optee->teedev);
++	if (optee->pool)
++		tee_shm_pool_free(optee->pool);
++	kfree(optee);
++	return ERR_PTR(rc);
++}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
++
++static const char *get_conduit_method(struct device_node *np)
++{
++	const char *method =3D NULL;
++
++	pr_info("probing for conduit method from DT.\n");
++
++	if (of_property_read_string(np, "method", &method)) {
++		pr_warn("missing \"method\" property\n");
++		return NULL;
++	}
++
++	return method;
++}
++
++static struct optee *optee_probe(struct device_node *np)
++{
++	const char *method =3D get_conduit_method(np);
++
++	if (!method)
++		return ERR_PTR(-ENXIO);
++
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++	if (!strcmp(method, "ffa"))
++		return optee_probe_ffa();
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
++
++	return optee_probe_legacy(method);
++}
++
+ static void optee_remove(struct optee *optee)
+ {
+ 	/*
+@@ -669,7 +1170,10 @@ static void optee_remove(struct optee *optee)
+ 	 * reference counters and also avoid wild pointers in secure world
+ 	 * into the old shared memory range.
+ 	 */
+-	optee_disable_shm_cache(optee);
++	if (optee->invoke_fn)
++		optee_disable_shm_cache(optee);
++	else
++		optee_ffa_disable_shm_cache(optee);
+=20
+ 	/*
+ 	 * The two devices has to be unregistered before we can free the
+@@ -684,6 +1188,13 @@ static void optee_remove(struct optee *optee)
+ 	optee_wait_queue_exit(&optee->wait_queue);
+ 	optee_supp_uninit(&optee->supp);
+ 	mutex_destroy(&optee->call_queue.mutex);
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++	if (optee->ffa.ops) {
++		mutex_destroy(&optee->ffa.mutex);
++		rhashtable_free_and_destroy(&optee->ffa.global_ids,
++					    rh_free_fn, NULL);
++	}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
+=20
+ 	kfree(optee);
+ }
+diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
+new file mode 100644
+index 000000000000..768e056ab491
+--- /dev/null
++++ b/drivers/tee/optee/optee_ffa.h
+@@ -0,0 +1,201 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/*
++ * Copyright (c) 2019, Linaro Limited
++ */
++
++/*
++ * This file is exported by OP-TEE and is in kept in sync between secure
++ * world and normal world kernel driver. We're using ARM FF-A 1.0 EAC
++ * specification.
++ */
++
++#ifndef __OPTEE_FFA_H
++#define __OPTEE_FFA_H
++
++#include <linux/arm_ffa.h>
++
++/*
++ * Normal world sends requests with FFA_MSG_SEND_DIRECT_REQ and
++ * responses are returned with FFA_MSG_SEND_DIRECT_RESP for normal
++ * messages.
++ *
++ * All requests with FFA_MSG_SEND_DIRECT_REQ and FFA_MSG_SEND_DIRECT_RESP
++ * are using the AArch32 SMC calling convention with register usage as
++ * defined in FF-A specification:
++ * w0:    Function ID (0x8400006F or 0x84000070)
++ * w1:    Source/Destination IDs
++ * w2:    Reserved (MBZ)
++ * w3-w7: Implementation defined, free to be used below
++ */
++
++#define OPTEE_FFA_VERSION_MAJOR	1
++#define OPTEE_FFA_VERSION_MINOR	0
++
++#define OPTEE_FFA_BLOCKING_CALL(id)	(id)
++#define OPTEE_FFA_YIELDING_CALL_BIT	31
++#define OPTEE_FFA_YIELDING_CALL(id)	((id) | BIT(OPTEE_FFA_YIELDING_CALL_B=
IT))
++
++/*
++ * Returns the API version implemented, currently follows the FF-A versio=
n.
++ * Call register usage:
++ * w3:    Service ID, OPTEE_FFA_GET_API_VERSION
++ * w4-w7: Not used (MBZ)
++ *
++ * Return register usage:
++ * w3:    OPTEE_FFA_VERSION_MAJOR
++ * w4:    OPTEE_FFA_VERSION_MINOR
++ * w5-w7: Not used (MBZ)
++ */
++#define OPTEE_FFA_GET_API_VERSION	OPTEE_FFA_BLOCKING_CALL(0)
++
++/*
++ * Returns the revision of OP-TEE.
++ *
++ * Used by non-secure world to figure out which version of the Trusted OS
++ * is installed. Note that the returned revision is the revision of the
++ * Trusted OS, not of the API.
++ *
++ * Call register usage:
++ * w3:    Service ID, OPTEE_FFA_GET_OS_VERSION
++ * w4-w7: Unused (MBZ)
++ *
++ * Return register usage:
++ * w3:    CFG_OPTEE_REVISION_MAJOR
++ * w4:    CFG_OPTEE_REVISION_MINOR
++ * w5:    TEE_IMPL_GIT_SHA1 (or zero if not supported)
++ */
++#define OPTEE_FFA_GET_OS_VERSION	OPTEE_FFA_BLOCKING_CALL(1)
++
++/*
++ * Exchange capabilities between normal world and secure world.
++ *
++ * Currently there are no defined capabilities. When features are added n=
ew
++ * capabilities may be added.
++ *
++ * Call register usage:
++ * w3:    Service ID, OPTEE_FFA_EXCHANGE_CAPABILITIES
++ * w4-w7: Note used (MBZ)
++ *
++ * Return register usage:
++ * w3:    Error code, 0 on success
++ * w4:    Bit[1:0]:  Number of pages of shared memory to register with
++ *                   OPTEE_FFA_REGISTER_RPC_SHM to support RPC
++ *        Bit[31:2]: Reserved (MBZ)
++ * w5-w7: Note used (MBZ)
++ */
++#define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
++
++/*
++ * Call with struct optee_msg_arg as argument in the supplied shared memo=
ry
++ * with a zero internal offset and normal cached memory attributes.
++ * Register usage:
++ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_WITH_ARG
++ * w4:    Shared memory handle, lower bits
++ * w5:    Shared memory handle, higher bits
++ * w6:    Offset into shared memory pointing to a struct optee_msg_arg
++ * w7:    Not used (MBZ)
++ *
++ * Call to register shared memory memory. The data is supplied in shared
++ * memory with a zero internal offset and normal cached memory attributes=
.
++ * The data is formatted as described in FFA 1.0 Beta1 Table 137 "
++ * Descriptor to retrieve a donated, lent or shared memory region".
++ * Register usage:
++ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_REGISTER_SHM
++ * w4:    Shared memory handle, lower bits
++ * w5:    Shared memory handle, higher bits
++ * w6-w7: Not used (MBZ)
++ *
++ * Call unregister shared memory register usage:
++ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM
++ * w4:    Shared memory handle, lower bits
++ * w5:    Shared memory handle, higher bits
++ * w6-w7: Not used (MBZ)
++ *
++ * Resume from RPC register usage:
++ * w3:    Service ID, OPTEE_FFA_YIELDING_CALL_RESUME
++ * If returning from OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SHM:
++ *	w4:    Shared memory handle, lower bits
++ *	w5:    Shared memory handle, higher bits
++ *	       If the allocation failed both w4 and w5 are 0
++ *	w6:    Offset into shared memory pointing the table If internal
++ *	       offset > 0 then one more page than requested has been allocated=
.
++ * else if resuming from another RPC:
++ *	w4-w6: Not used (MBZ)
++ * w7:    Resume info
++ *
++ * Normal return (yielding call is completed) register usage:
++ * w3:    Error code, 0 on success
++ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_DONE
++ * w5-w7: Not used (MBZ)
++ *
++ * Alloc SHM return (RPC from secure world) register usage:
++ * w3:    Error code =3D=3D 0
++ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM or
++ *	  OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SUPPL_SHM
++ *	  allocate kernel private or supplicant memory respectively.
++ * w5:    Number of pages of shared memory
++ * w6:    Not used (MBZ)
++ * w7:    Resume info
++ *
++ * Free SHM return (RPC from secure world) register usage:
++ * w3:    Error code =3D=3D 0
++ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_FREE_KERN_SHM or
++ *	  OPTEE_FFA_YIELDING_CALL_RETURN_FREE_SUPPL_SHM
++ *	  free kernel private or supplicant memory respectively.
++ * w5	  Shared memory handle to free, lower bits
++ * w6	  Shared memory handle to free, higher bits
++ *	  The handle previously allocated with
++ *	  OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM or
++ *	  OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SUPPL_SHM.
++ * w7:    Resume info
++ *
++ * RPC cmd return (RPC from secure world) register usage:
++ * w3:    Error code =3D=3D 0
++ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD
++ * w5:    Shared memory handle, lower bits
++ * w6:    Shared memory handle, higher bits
++ *	  The handle contains aed the RPC.
++ * w7:    Resume info
++ *
++ * RPC interrupt return (RPC from secure world) register usage:
++ * w3:    Error code =3D=3D 0
++ * w4:    OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT
++ * w5-w6: Not used (MBZ)
++ * w7:    Resume info
++ *
++ * Possible error codes in register w3:
++ * 0:                       Success
++ * FFA_DENIED:             w4 isn't one of OPTEE_FFA_YIELDING_CALL_START
++ *                          OPTEE_FFA_YIELDING_CALL_REGISTER_SHM,
++ *                          OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM or
++ *                          OPTEE_FFA_YIELDING_CALL_RESUME
++ *
++ * Possible error codes for OPTEE_FFA_YIELDING_CALL_START,
++ * OPTEE_FFA_YIELDING_CALL_REGISTER_SHM and
++ * OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM
++ * FFA_BUSY:               Number of OP-TEE OS threads exceeded,
++ *                          try again later
++ * FFA_DENIED:             RPC shared memory object not found
++ * FFA_INVALID_PARAMETER:  Bad shared memory handle or offset into the me=
mory
++ *
++ * Possible error codes for OPTEE_FFA_YIELDING_CALL_RESUME
++ * FFA_INVALID_PARAMETER:  Bad resume info
++ *
++ */
++#define OPTEE_FFA_YIELDING_CALL_WITH_ARG	OPTEE_FFA_YIELDING_CALL(0)
++#define OPTEE_FFA_YIELDING_CALL_REGISTER_SHM	OPTEE_FFA_YIELDING_CALL(1)
++#define OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM	OPTEE_FFA_YIELDING_CALL(2)
++#define OPTEE_FFA_YIELDING_CALL_RESUME		OPTEE_FFA_YIELDING_CALL(3)
++
++#define OPTEE_FFA_YIELDING_CALL_RETURN_DONE		0
++#define OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM	1
++#define OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SUPPL_SHM	2
++#define OPTEE_FFA_YIELDING_CALL_RETURN_RESERVED0	3
++#define OPTEE_FFA_YIELDING_CALL_RETURN_FREE_KERN_SHM	4
++#define OPTEE_FFA_YIELDING_CALL_RETURN_FREE_SUPPL_SHM	5
++#define OPTEE_FFA_YIELDING_CALL_RETURN_RESERVED1	6
++#define OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD		7
++#define OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT	8
++
++#endif /*__OPTEE_FFA_H*/
++
+diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
+index 795bc19ae17a..95ee82c11733 100644
+--- a/drivers/tee/optee/optee_msg.h
++++ b/drivers/tee/optee/optee_msg.h
+@@ -1,6 +1,5 @@
+-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+ /*
+- * Copyright (c) 2015-2019, Linaro Limited
++ * Copyright (c) 2015-2020, Linaro Limited
+  */
+ #ifndef _OPTEE_MSG_H
+ #define _OPTEE_MSG_H
+@@ -11,12 +10,6 @@
+ /*
+  * This file defines the OP-TEE message protocol used to communicate
+  * with an instance of OP-TEE running in secure world.
+- *
+- * This file is divided into three sections.
+- * 1. Formatting of messages.
+- * 2. Requests from normal world
+- * 3. Requests from secure world, Remote Procedure Call (RPC), handled by
+- *    tee-supplicant.
+  */
+=20
+ /************************************************************************=
*****
+@@ -30,6 +23,9 @@
+ #define OPTEE_MSG_ATTR_TYPE_RMEM_INPUT		0x5
+ #define OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT		0x6
+ #define OPTEE_MSG_ATTR_TYPE_RMEM_INOUT		0x7
++#define OPTEE_MSG_ATTR_TYPE_SMEM_INPUT		OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
++#define OPTEE_MSG_ATTR_TYPE_SMEM_OUTPUT		OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT
++#define OPTEE_MSG_ATTR_TYPE_SMEM_INOUT		OPTEE_MSG_ATTR_TYPE_RMEM_INOUT
+ #define OPTEE_MSG_ATTR_TYPE_TMEM_INPUT		0x9
+ #define OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT		0xa
+ #define OPTEE_MSG_ATTR_TYPE_TMEM_INOUT		0xb
+@@ -54,14 +50,14 @@
+  * Every entry in buffer should point to a 4k page beginning (12 least
+  * significant bits must be equal to zero).
+  *
+- * 12 least significant bints of optee_msg_param.u.tmem.buf_ptr should ho=
ld page
+- * offset of the user buffer.
++ * 12 least significant bits of optee_msg_param.u.tmem.buf_ptr should hol=
d
++ * page offset of user buffer.
+  *
+  * So, entries should be placed like members of this structure:
+  *
+  * struct page_data {
+- *   uint64_t pages_array[OPTEE_MSG_NONCONTIG_PAGE_SIZE/sizeof(uint64_t) =
- 1];
+- *   uint64_t next_page_data;
++ *   u64 pages_array[OPTEE_MSG_NONCONTIG_PAGE_SIZE/sizeof(u64) - 1];
++ *   u64 next_page_data;
+  * };
+  *
+  * Structure is designed to exactly fit into the page size
+@@ -129,6 +125,23 @@ struct optee_msg_param_rmem {
+ 	u64 shm_ref;
+ };
+=20
++/**
++ * struct optee_msg_param_smem - ffa memory reference parameter
++ * @offs_lower:	   Lower bits of offset into shared memory reference
++ * @offs_upper:	   Upper bits of offset into shared memory reference
++ * @internal_offs: Internal offset into the first page of shared memory
++ *		   reference
++ * @size:	   Size of the buffer
++ * @global_id:	   Global identifier of Shared memory
++ */
++struct optee_msg_param_smem {
++	u32 offs_low;
++	u16 offs_high;
++	u16 internal_offs;
++	u64 size;
++	u64 global_id;
++};
++
+ /**
+  * struct optee_msg_param_value - opaque value parameter
+  *
+@@ -145,12 +158,14 @@ struct optee_msg_param_value {
+  * @attr:	attributes
+  * @tmem:	parameter by temporary memory reference
+  * @rmem:	parameter by registered memory reference
++ * @smem:	parameter by ffa registered memory reference
+  * @value:	parameter by opaque value
+  *
+  * @attr & OPTEE_MSG_ATTR_TYPE_MASK indicates if tmem, rmem or value is u=
sed in
+  * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value,
+  * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @tmem and
+- * OPTEE_MSG_ATTR_TYPE_RMEM_* indicates @rmem,
++ * OPTEE_MSG_ATTR_TYPE_RMEM_* or the alias PTEE_MSG_ATTR_TYPE_SMEM_* indi=
cates
++ * @rmem or @smem depending on the conduit.
+  * OPTEE_MSG_ATTR_TYPE_NONE indicates that none of the members are used.
+  */
+ struct optee_msg_param {
+@@ -158,6 +173,7 @@ struct optee_msg_param {
+ 	union {
+ 		struct optee_msg_param_tmem tmem;
+ 		struct optee_msg_param_rmem rmem;
++		struct optee_msg_param_smem smem;
+ 		struct optee_msg_param_value value;
+ 	} u;
+ };
+@@ -176,17 +192,9 @@ struct optee_msg_param {
+  * @params: the parameters supplied to the OS Command
+  *
+  * All normal calls to Trusted OS uses this struct. If cmd requires furth=
er
+- * information than what these field holds it can be passed as a paramete=
r
++ * information than what these fields hold it can be passed as a paramete=
r
+  * tagged as meta (setting the OPTEE_MSG_ATTR_META bit in corresponding
+- * attrs field). All parameters tagged as meta has to come first.
+- *
+- * Temp memref parameters can be fragmented if supported by the Trusted O=
S
+- * (when optee_smc.h is bearer of this protocol this is indicated with
+- * OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM). If a logical memref parameter is
+- * fragmented then has all but the last fragment the
+- * OPTEE_MSG_ATTR_FRAGMENT bit set in attrs. Even if a memref is fragment=
ed
+- * it will still be presented as a single logical memref to the Trusted
+- * Application.
++ * attrs field). All parameters tagged as meta have to come first.
+  */
+ struct optee_msg_arg {
+ 	u32 cmd;
+@@ -199,7 +207,7 @@ struct optee_msg_arg {
+ 	u32 num_params;
+=20
+ 	/* num_params tells the actual number of element in params */
+-	struct optee_msg_param params[0];
++	struct optee_msg_param params[];
+ };
+=20
+ /**
+@@ -290,13 +298,10 @@ struct optee_msg_arg {
+  * OPTEE_MSG_CMD_REGISTER_SHM registers a shared memory reference. The
+  * information is passed as:
+  * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
+- *					[| OPTEE_MSG_ATTR_FRAGMENT]
++ *					[| OPTEE_MSG_ATTR_NONCONTIG]
+  * [in] param[0].u.tmem.buf_ptr		physical address (of first fragment)
+  * [in] param[0].u.tmem.size		size (of first fragment)
+  * [in] param[0].u.tmem.shm_ref		holds shared memory reference
+- * ...
+- * The shared memory can optionally be fragmented, temp memrefs can follo=
w
+- * each other with all but the last with the OPTEE_MSG_ATTR_FRAGMENT bit =
set.
+  *
+  * OPTEE_MSG_CMD_UNREGISTER_SHM unregisteres a previously registered shar=
ed
+  * memory reference. The information is passed as:
+@@ -313,110 +318,4 @@ struct optee_msg_arg {
+ #define OPTEE_MSG_CMD_UNREGISTER_SHM	5
+ #define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
+=20
+-/************************************************************************=
*****
+- * Part 3 - Requests from secure world, RPC
+- ************************************************************************=
*****/
+-
+-/*
+- * All RPC is done with a struct optee_msg_arg as bearer of information,
+- * struct optee_msg_arg::arg holds values defined by OPTEE_MSG_RPC_CMD_* =
below
+- *
+- * RPC communication with tee-supplicant is reversed compared to normal
+- * client communication desribed above. The supplicant receives requests
+- * and sends responses.
+- */
+-
+-/*
+- * Load a TA into memory, defined in tee-supplicant
+- */
+-#define OPTEE_MSG_RPC_CMD_LOAD_TA	0
+-
+-/*
+- * Reserved
+- */
+-#define OPTEE_MSG_RPC_CMD_RPMB		1
+-
+-/*
+- * File system access, defined in tee-supplicant
+- */
+-#define OPTEE_MSG_RPC_CMD_FS		2
+-
+-/*
+- * Get time
+- *
+- * Returns number of seconds and nano seconds since the Epoch,
+- * 1970-01-01 00:00:00 +0000 (UTC).
+- *
+- * [out] param[0].u.value.a	Number of seconds
+- * [out] param[0].u.value.b	Number of nano seconds.
+- */
+-#define OPTEE_MSG_RPC_CMD_GET_TIME	3
+-
+-/*
+- * Wait queue primitive, helper for secure world to implement a wait queu=
e.
+- *
+- * If secure world need to wait for a secure world mutex it issues a slee=
p
+- * request instead of spinning in secure world. Conversely is a wakeup
+- * request issued when a secure world mutex with a thread waiting thread =
is
+- * unlocked.
+- *
+- * Waiting on a key
+- * [in] param[0].u.value.a OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP
+- * [in] param[0].u.value.b wait key
+- *
+- * Waking up a key
+- * [in] param[0].u.value.a OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP
+- * [in] param[0].u.value.b wakeup key
+- */
+-#define OPTEE_MSG_RPC_CMD_WAIT_QUEUE	4
+-#define OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP	0
+-#define OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP	1
+-
+-/*
+- * Suspend execution
+- *
+- * [in] param[0].value	.a number of milliseconds to suspend
+- */
+-#define OPTEE_MSG_RPC_CMD_SUSPEND	5
+-
+-/*
+- * Allocate a piece of shared memory
+- *
+- * Shared memory can optionally be fragmented, to support that additional
+- * spare param entries are allocated to make room for eventual fragments.
+- * The spare param entries has .attr =3D OPTEE_MSG_ATTR_TYPE_NONE when
+- * unused. All returned temp memrefs except the last should have the
+- * OPTEE_MSG_ATTR_FRAGMENT bit set in the attr field.
+- *
+- * [in]  param[0].u.value.a		type of memory one of
+- *					OPTEE_MSG_RPC_SHM_TYPE_* below
+- * [in]  param[0].u.value.b		requested size
+- * [in]  param[0].u.value.c		required alignment
+- *
+- * [out] param[0].u.tmem.buf_ptr	physical address (of first fragment)
+- * [out] param[0].u.tmem.size		size (of first fragment)
+- * [out] param[0].u.tmem.shm_ref	shared memory reference
+- * ...
+- * [out] param[n].u.tmem.buf_ptr	physical address
+- * [out] param[n].u.tmem.size		size
+- * [out] param[n].u.tmem.shm_ref	shared memory reference (same value
+- *					as in param[n-1].u.tmem.shm_ref)
+- */
+-#define OPTEE_MSG_RPC_CMD_SHM_ALLOC	6
+-/* Memory that can be shared with a non-secure user space application */
+-#define OPTEE_MSG_RPC_SHM_TYPE_APPL	0
+-/* Memory only shared with non-secure kernel */
+-#define OPTEE_MSG_RPC_SHM_TYPE_KERNEL	1
+-
+-/*
+- * Free shared memory previously allocated with OPTEE_MSG_RPC_CMD_SHM_ALL=
OC
+- *
+- * [in]  param[0].u.value.a		type of memory one of
+- *					OPTEE_MSG_RPC_SHM_TYPE_* above
+- * [in]  param[0].u.value.b		value of shared memory reference
+- *					returned in param[0].u.tmem.shm_ref
+- *					above
+- */
+-#define OPTEE_MSG_RPC_CMD_SHM_FREE	7
+-
+ #endif /* _OPTEE_MSG_H */
+diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_p=
rivate.h
+index d9c5037b4e03..d12d9b9f6d33 100644
+--- a/drivers/tee/optee/optee_private.h
++++ b/drivers/tee/optee/optee_private.h
+@@ -7,6 +7,7 @@
+ #define OPTEE_PRIVATE_H
+=20
+ #include <linux/arm-smccc.h>
++#include <linux/rhashtable.h>
+ #include <linux/semaphore.h>
+ #include <linux/tee_drv.h>
+ #include <linux/types.h>
+@@ -17,6 +18,7 @@
+ /* Some Global Platform error codes used in this driver */
+ #define TEEC_SUCCESS			0x00000000
+ #define TEEC_ERROR_BAD_PARAMETERS	0xFFFF0006
++#define TEEC_ERROR_NOT_SUPPORTED	0xFFFF000A
+ #define TEEC_ERROR_COMMUNICATION	0xFFFF000E
+ #define TEEC_ERROR_OUT_OF_MEMORY	0xFFFF000C
+ #define TEEC_ERROR_SHORT_BUFFER		0xFFFF0010
+@@ -65,6 +67,32 @@ struct optee_supp {
+ 	struct completion reqs_c;
+ };
+=20
++/**
++ * struct optee_ffa_data -  FFA communication struct
++ * @dst			FFA destination id, the id of OP-TEE in secure world
++ * @ops			FFA operations
++ * @mutex		Serializes access to @global_ids
++ * @global_ids		FF-A shared memory global handle translation
++ */
++struct optee_ffa {
++	u32 dst;
++	struct ffa_ops *ops;
++	struct mutex mutex;
++	struct rhashtable global_ids;
++};
++
++struct optee;
++struct optee_ops {
++	int (*do_call_with_arg)(struct tee_context *ctx,
++				struct tee_shm *shm_arg);
++	int (*to_msg_param)(struct optee *optee,
++			    struct optee_msg_param *msg_params,
++			    size_t num_params, const struct tee_param *params);
++	int (*from_msg_param)(struct optee *optee, struct tee_param *params,
++			      size_t num_params,
++			      const struct optee_msg_param *msg_params);
++};
++
+ /**
+  * struct optee - main service struct
+  * @supp_teedev:	supplicant device
+@@ -82,7 +110,11 @@ struct optee_supp {
+ struct optee {
+ 	struct tee_device *supp_teedev;
+ 	struct tee_device *teedev;
++	const struct optee_ops *ops;
+ 	optee_invoke_fn *invoke_fn;
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++	struct optee_ffa ffa;
++#endif
+ 	struct optee_call_queue call_queue;
+ 	struct optee_wait_queue wait_queue;
+ 	struct optee_supp supp;
+@@ -141,10 +173,11 @@ int optee_supp_recv(struct tee_context *ctx, u32 *fu=
nc, u32 *num_params,
+ int optee_supp_send(struct tee_context *ctx, u32 ret, u32 num_params,
+ 		    struct tee_param *param);
+=20
+-u32 optee_do_call_with_arg(struct tee_context *ctx, phys_addr_t parg);
++int optee_do_call_with_arg(struct tee_context *ctx, struct tee_shm *arg);
+ int optee_open_session(struct tee_context *ctx,
+ 		       struct tee_ioctl_open_session_arg *arg,
+ 		       struct tee_param *param);
++int optee_close_session_helper(struct tee_context *ctx, u32 session);
+ int optee_close_session(struct tee_context *ctx, u32 session);
+ int optee_invoke_func(struct tee_context *ctx, struct tee_ioctl_invoke_ar=
g *arg,
+ 		      struct tee_param *param);
+@@ -163,11 +196,6 @@ int optee_shm_register_supp(struct tee_context *ctx, =
struct tee_shm *shm,
+ 			    unsigned long start);
+ int optee_shm_unregister_supp(struct tee_context *ctx, struct tee_shm *sh=
m);
+=20
+-int optee_from_msg_param(struct tee_param *params, size_t num_params,
+-			 const struct optee_msg_param *msg_params);
+-int optee_to_msg_param(struct optee_msg_param *msg_params, size_t num_par=
ams,
+-		       const struct tee_param *params);
+-
+ u64 *optee_allocate_pages_list(size_t num_entries);
+ void optee_free_pages_list(void *array, size_t num_entries);
+ void optee_fill_pages_list(u64 *dst, struct page **pages, int num_pages,
+@@ -175,6 +203,27 @@ void optee_fill_pages_list(u64 *dst, struct page **pa=
ges, int num_pages,
+=20
+ int optee_enumerate_devices(void);
+=20
++int optee_shm_add_ffa_handle(struct optee *optee, struct tee_shm *shm,
++			     u64 global_id);
++int optee_shm_rem_ffa_handle(struct optee *optee, u64 global_id);
++
++struct tee_shm *optee_shm_from_ffa_handle(struct optee *optee, u64 global=
_id);
++void optee_ffa_disable_shm_cache(struct optee *optee);
++
++int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
++			    struct page **pages, size_t num_pages,
++			    unsigned long start);
++int optee_ffa_shm_unregister(struct tee_context *ctx, struct tee_shm *shm=
);
++int optee_ffa_shm_register_supp(struct tee_context *ctx, struct tee_shm *=
shm,
++				 struct page **pages, size_t num_pages,
++				 unsigned long start);
++int optee_ffa_shm_unregister_supp(struct tee_context *ctx,
++				   struct tee_shm *shm);
++
++int optee_ffa_do_call_with_arg(struct tee_context *ctx, struct tee_shm *a=
rg);
++int optee_ffa_rpc_shm_register(struct tee_context *ctx, struct tee_shm *s=
hm);
++void optee_handle_ffa_rpc(struct tee_context *ctx, u32 *w4, u32 *w5, u32 =
*w6);
++
+ /*
+  * Small helpers
+  */
+diff --git a/drivers/tee/optee/optee_rpc_cmd.h b/drivers/tee/optee/optee_r=
pc_cmd.h
+new file mode 100644
+index 000000000000..712aa32513d7
+--- /dev/null
++++ b/drivers/tee/optee/optee_rpc_cmd.h
+@@ -0,0 +1,333 @@
++/* SPDX-License-Identifier: BSD-2-Clause */
++/*
++ * Copyright (c) 2016-2018, Linaro Limited
++ */
++
++#ifndef __OPTEE_RPC_CMD_H
++#define __OPTEE_RPC_CMD_H
++
++/*
++ * All RPC is done with a struct optee_msg_arg as bearer of information,
++ * struct optee_msg_arg::arg holds values defined by OPTEE_RPC_CMD_* belo=
w.
++ * Only the commands handled by the kernel driver are defined here.
++ *
++ * RPC communication with tee-supplicant is reversed compared to normal
++ * client communication described above. The supplicant receives requests
++ * and sends responses.
++ */
++
++/*
++ * Load a TA into memory
++ *
++ * Since the size of the TA isn't known in advance the size of the TA is
++ * can be queried with a NULL buffer.
++ *
++ * [in]     value[0].a-b    UUID
++ * [out]    memref[1]	    Buffer with TA
++ */
++#define OPTEE_RPC_CMD_LOAD_TA		0
++
++/*
++ * Replay Protected Memory Block access
++ *
++ * [in]     memref[0]	    Frames to device
++ * [out]    memref[1]	    Frames from device
++ */
++#define OPTEE_RPC_CMD_RPMB		1
++
++/*
++ * File system access, see definition of protocol below
++ */
++#define OPTEE_RPC_CMD_FS		2
++
++/*
++ * Get time
++ *
++ * Returns number of seconds and nano seconds since the Epoch,
++ * 1970-01-01 00:00:00 +0000 (UTC).
++ *
++ * [out]    value[0].a	    Number of seconds
++ * [out]    value[0].b	    Number of nano seconds.
++ */
++#define OPTEE_RPC_CMD_GET_TIME		3
++
++/*
++ * Wait queue primitive, helper for secure world to implement a wait queu=
e.
++ *
++ * If secure world needs to wait for a secure world mutex it issues a sle=
ep
++ * request instead of spinning in secure world. Conversely is a wakeup
++ * request issued when a secure world mutex with a thread waiting thread =
is
++ * unlocked.
++ *
++ * Waiting on a key
++ * [in]    value[0].a	    OPTEE_RPC_WAIT_QUEUE_SLEEP
++ * [in]    value[0].b	    Wait key
++ *
++ * Waking up a key
++ * [in]    value[0].a	    OPTEE_RPC_WAIT_QUEUE_WAKEUP
++ * [in]    value[0].b	    Wakeup key
++ */
++#define OPTEE_RPC_CMD_WAIT_QUEUE	4
++#define OPTEE_RPC_WAIT_QUEUE_SLEEP	0
++#define OPTEE_RPC_WAIT_QUEUE_WAKEUP	1
++
++/*
++ * Suspend execution
++ *
++ * [in]    value[0].a	Number of milliseconds to suspend
++ */
++#define OPTEE_RPC_CMD_SUSPEND		5
++
++/*
++ * Allocate a piece of shared memory
++ *
++ * [in]    value[0].a	    Type of memory one of
++ *			    OPTEE_RPC_SHM_TYPE_* below
++ * [in]    value[0].b	    Requested size
++ * [in]    value[0].c	    Required alignment
++ * [out]   memref[0]	    Buffer
++ */
++#define OPTEE_RPC_CMD_SHM_ALLOC		6
++/* Memory that can be shared with a non-secure user space application */
++#define OPTEE_RPC_SHM_TYPE_APPL		0
++/* Memory only shared with non-secure kernel */
++#define OPTEE_RPC_SHM_TYPE_KERNEL	1
++/*
++ * Memory shared with non-secure kernel and exported to a non-secure user
++ * space application
++ */
++#define OPTEE_RPC_SHM_TYPE_GLOBAL	2
++
++/*
++ * Free shared memory previously allocated with OPTEE_RPC_CMD_SHM_ALLOC
++ *
++ * [in]     value[0].a	    Type of memory one of
++ *			    OPTEE_RPC_SHM_TYPE_* above
++ * [in]     value[0].b	    Value of shared memory reference or cookie
++ */
++#define OPTEE_RPC_CMD_SHM_FREE		7
++
++/* Was OPTEE_RPC_CMD_SQL_FS, which isn't supported any longer */
++#define OPTEE_RPC_CMD_SQL_FS_RESERVED	8
++
++/*
++ * Send TA profiling information to normal world
++ *
++ * [in/out] value[0].a	    File identifier. Must be set to 0 on
++ *			    first call. A value >=3D 1 will be
++ *			    returned on success. Re-use this value
++ *			    to append data to the same file.
++ * [in]     memref[1]	    TA UUID
++ * [in]     memref[2]	    Profile data
++ */
++#define OPTEE_RPC_CMD_GPROF		9
++
++/*
++ * Socket command, see definition of protocol below
++ */
++#define OPTEE_RPC_CMD_SOCKET		10
++
++/*
++ * Send TA function graph data to normal world
++ *
++ * [in/out] value[0].a	    File identifier. Must be set to 0 on
++ *			    first call. A value >=3D 1 will be
++ *			    returned on success. Re-use this value
++ *			    to append data to the same file.
++ * [in]     memref[1]	    TA UUID
++ * [in]     memref[2]	    function graph data
++ */
++#define OPTEE_RPC_CMD_FTRACE		11
++
++/*
++ * Register timestamp buffer in the linux kernel optee driver
++ *
++ * [in]     value[0].a	    Subcommand (register buffer, unregister buffer=
)
++ *			    OPTEE_RPC_CMD_BENCH_REG_* below
++ * [in]     value[0].b	    Physical address of timestamp buffer
++ * [in]     value[0].c	    Size of buffer
++ */
++#define OPTEE_RPC_CMD_BENCH_REG_NEW	0
++#define OPTEE_RPC_CMD_BENCH_REG_DEL	1
++#define OPTEE_RPC_CMD_BENCH_REG		20
++
++/*
++ * Definition of protocol for command OPTEE_RPC_CMD_FS
++ */
++
++/*
++ * Open a file
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_OPEN
++ * [in]     memref[1]	    A string holding the file name
++ * [out]    value[2].a	    File descriptor of open file
++ */
++#define OPTEE_RPC_FS_OPEN		0
++
++/*
++ * Create a file
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_CREATE
++ * [in]     memref[1]	    A string holding the file name
++ * [out]    value[2].a	    File descriptor of open file
++ */
++#define OPTEE_RPC_FS_CREATE		1
++
++/*
++ * Close a file
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_CLOSE
++ * [in]     value[0].b	    File descriptor of open file.
++ */
++#define OPTEE_RPC_FS_CLOSE		2
++
++/*
++ * Read from a file
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_READ
++ * [in]     value[0].b	    File descriptor of open file
++ * [in]     value[0].c	    Offset into file
++ * [out]    memref[1]	    Buffer to hold returned data
++ */
++#define OPTEE_RPC_FS_READ		3
++
++/*
++ * Write to a file
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_WRITE
++ * [in]     value[0].b	    File descriptor of open file
++ * [in]     value[0].c	    Offset into file
++ * [in]     memref[1]	    Buffer holding data to be written
++ */
++#define OPTEE_RPC_FS_WRITE		4
++
++/*
++ * Truncate a file
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_TRUNCATE
++ * [in]     value[0].b	    File descriptor of open file
++ * [in]     value[0].c	    Length of file.
++ */
++#define OPTEE_RPC_FS_TRUNCATE		5
++
++/*
++ * Remove a file
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_REMOVE
++ * [in]     memref[1]	    A string holding the file name
++ */
++#define OPTEE_RPC_FS_REMOVE		6
++
++/*
++ * Rename a file
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_RENAME
++ * [in]     value[0].b	    True if existing target should be removed
++ * [in]     memref[1]	    A string holding the old file name
++ * [in]     memref[2]	    A string holding the new file name
++ */
++#define OPTEE_RPC_FS_RENAME		7
++
++/*
++ * Opens a directory for file listing
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_OPENDIR
++ * [in]     memref[1]	    A string holding the name of the directory
++ * [out]    value[2].a	    Handle to open directory
++ */
++#define OPTEE_RPC_FS_OPENDIR		8
++
++/*
++ * Closes a directory handle
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_CLOSEDIR
++ * [in]     value[0].b	    Handle to open directory
++ */
++#define OPTEE_RPC_FS_CLOSEDIR		9
++
++/*
++ * Read next file name of directory
++ *
++ *
++ * [in]     value[0].a	    OPTEE_RPC_FS_READDIR
++ * [in]     value[0].b	    Handle to open directory
++ * [out]    memref[1]	    A string holding the file name
++ */
++#define OPTEE_RPC_FS_READDIR		10
++
++/* End of definition of protocol for command OPTEE_RPC_CMD_FS */
++
++/*
++ * Definition of protocol for command OPTEE_RPC_CMD_SOCKET
++ */
++
++#define OPTEE_RPC_SOCKET_TIMEOUT_NONBLOCKING	0
++#define OPTEE_RPC_SOCKET_TIMEOUT_BLOCKING	0xffffffff
++
++/*
++ * Open socket
++ *
++ * [in]     value[0].a	    OPTEE_RPC_SOCKET_OPEN
++ * [in]     value[0].b	    TA instance id
++ * [in]     value[1].a	    Server port number
++ * [in]     value[1].b	    Protocol, TEE_ISOCKET_PROTOCOLID_*
++ * [in]     value[1].c	    Ip version TEE_IP_VERSION_* from tee_ipsocket.=
h
++ * [in]     memref[2]	    Server address
++ * [out]    value[3].a	    Socket handle (32-bit)
++ */
++#define OPTEE_RPC_SOCKET_OPEN	0
++
++/*
++ * Close socket
++ *
++ * [in]     value[0].a	    OPTEE_RPC_SOCKET_CLOSE
++ * [in]     value[0].b	    TA instance id
++ * [in]     value[0].c	    Socket handle
++ */
++#define OPTEE_RPC_SOCKET_CLOSE	1
++
++/*
++ * Close all sockets
++ *
++ * [in]     value[0].a	    OPTEE_RPC_SOCKET_CLOSE_ALL
++ * [in]     value[0].b	    TA instance id
++ */
++#define OPTEE_RPC_SOCKET_CLOSE_ALL 2
++
++/*
++ * Send data on socket
++ *
++ * [in]     value[0].a	    OPTEE_RPC_SOCKET_SEND
++ * [in]     value[0].b	    TA instance id
++ * [in]     value[0].c	    Socket handle
++ * [in]     memref[1]	    Buffer to transmit
++ * [in]     value[2].a	    Timeout ms or OPTEE_RPC_SOCKET_TIMEOUT_*
++ * [out]    value[2].b	    Number of transmitted bytes
++ */
++#define OPTEE_RPC_SOCKET_SEND	3
++
++/*
++ * Receive data on socket
++ *
++ * [in]     value[0].a	    OPTEE_RPC_SOCKET_RECV
++ * [in]     value[0].b	    TA instance id
++ * [in]     value[0].c	    Socket handle
++ * [out]    memref[1]	    Buffer to receive
++ * [in]     value[2].a	    Timeout ms or OPTEE_RPC_SOCKET_TIMEOUT_*
++ */
++#define OPTEE_RPC_SOCKET_RECV	4
++
++/*
++ * Perform IOCTL on socket
++ *
++ * [in]     value[0].a	    OPTEE_RPC_SOCKET_IOCTL
++ * [in]     value[0].b	    TA instance id
++ * [in]     value[0].c	    Socket handle
++ * [in/out] memref[1]	    Buffer
++ * [in]     value[2].a	    Ioctl command
++ */
++#define OPTEE_RPC_SOCKET_IOCTL	5
++
++/* End of definition of protocol for command OPTEE_RPC_CMD_SOCKET */
++
++#endif /*__OPTEE_RPC_CMD_H*/
+diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
+index b4ade54d1f28..ca5d5d01b58f 100644
+--- a/drivers/tee/optee/rpc.c
++++ b/drivers/tee/optee/rpc.c
+@@ -9,8 +9,11 @@
+ #include <linux/device.h>
+ #include <linux/slab.h>
+ #include <linux/tee_drv.h>
++#include "optee_msg.h"
+ #include "optee_private.h"
++#include "optee_rpc_cmd.h"
+ #include "optee_smc.h"
++#include "optee_ffa.h"
+=20
+ struct wq_entry {
+ 	struct list_head link;
+@@ -102,10 +105,10 @@ static void handle_rpc_func_cmd_wq(struct optee *opt=
ee,
+ 		goto bad;
+=20
+ 	switch (arg->params[0].u.value.a) {
+-	case OPTEE_MSG_RPC_WAIT_QUEUE_SLEEP:
++	case OPTEE_RPC_WAIT_QUEUE_SLEEP:
+ 		wq_sleep(&optee->wait_queue, arg->params[0].u.value.b);
+ 		break;
+-	case OPTEE_MSG_RPC_WAIT_QUEUE_WAKEUP:
++	case OPTEE_RPC_WAIT_QUEUE_WAKEUP:
+ 		wq_wakeup(&optee->wait_queue, arg->params[0].u.value.b);
+ 		break;
+ 	default:
+@@ -140,10 +143,10 @@ static void handle_rpc_func_cmd_wait(struct optee_ms=
g_arg *arg)
+ 	arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+ }
+=20
+-static void handle_rpc_supp_cmd(struct tee_context *ctx,
++static void handle_rpc_supp_cmd(struct tee_context *ctx, struct optee *op=
tee,
+ 				struct optee_msg_arg *arg)
+ {
+-	struct tee_param *params;
++	struct tee_param *params =3D NULL;
+=20
+ 	arg->ret_origin =3D TEEC_ORIGIN_COMMS;
+=20
+@@ -154,32 +157,36 @@ static void handle_rpc_supp_cmd(struct tee_context *=
ctx,
+ 		return;
+ 	}
+=20
+-	if (optee_from_msg_param(params, arg->num_params, arg->params)) {
++	if (optee->ops->from_msg_param(optee, params, arg->num_params,
++				       arg->params)) {
+ 		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+ 		goto out;
+ 	}
+=20
+ 	arg->ret =3D optee_supp_thrd_req(ctx, arg->cmd, arg->num_params, params)=
;
+=20
+-	if (optee_to_msg_param(arg->params, arg->num_params, params))
++	if (optee->ops->to_msg_param(optee, arg->params, arg->num_params,
++				     params))
+ 		arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
+ out:
+ 	kfree(params);
+ }
+=20
++
++
+ static struct tee_shm *cmd_alloc_suppl(struct tee_context *ctx, size_t sz=
)
+ {
+-	u32 ret;
+-	struct tee_param param;
+ 	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+-	struct tee_shm *shm;
++	struct tee_param param =3D { };
++	struct tee_shm *shm =3D NULL;
++	u32 ret =3D 0;
+=20
+ 	param.attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
+-	param.u.value.a =3D OPTEE_MSG_RPC_SHM_TYPE_APPL;
++	param.u.value.a =3D OPTEE_RPC_SHM_TYPE_APPL;
+ 	param.u.value.b =3D sz;
+ 	param.u.value.c =3D 0;
+=20
+-	ret =3D optee_supp_thrd_req(ctx, OPTEE_MSG_RPC_CMD_SHM_ALLOC, 1, &param)=
;
++	ret =3D optee_supp_thrd_req(ctx, OPTEE_RPC_CMD_SHM_ALLOC, 1, &param);
+ 	if (ret)
+ 		return ERR_PTR(-ENOMEM);
+=20
+@@ -216,10 +223,10 @@ static void handle_rpc_func_cmd_shm_alloc(struct tee=
_context *ctx,
+=20
+ 	sz =3D arg->params[0].u.value.b;
+ 	switch (arg->params[0].u.value.a) {
+-	case OPTEE_MSG_RPC_SHM_TYPE_APPL:
++	case OPTEE_RPC_SHM_TYPE_APPL:
+ 		shm =3D cmd_alloc_suppl(ctx, sz);
+ 		break;
+-	case OPTEE_MSG_RPC_SHM_TYPE_KERNEL:
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
+ 		shm =3D tee_shm_alloc(ctx, sz, TEE_SHM_MAPPED);
+ 		break;
+ 	default:
+@@ -291,7 +298,7 @@ static void cmd_free_suppl(struct tee_context *ctx, st=
ruct tee_shm *shm)
+ 	struct tee_param param;
+=20
+ 	param.attr =3D TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
+-	param.u.value.a =3D OPTEE_MSG_RPC_SHM_TYPE_APPL;
++	param.u.value.a =3D OPTEE_RPC_SHM_TYPE_APPL;
+ 	param.u.value.b =3D tee_shm_get_id(shm);
+ 	param.u.value.c =3D 0;
+=20
+@@ -308,7 +315,7 @@ static void cmd_free_suppl(struct tee_context *ctx, st=
ruct tee_shm *shm)
+ 	 */
+ 	tee_shm_put(shm);
+=20
+-	optee_supp_thrd_req(ctx, OPTEE_MSG_RPC_CMD_SHM_FREE, 1, &param);
++	optee_supp_thrd_req(ctx, OPTEE_RPC_CMD_SHM_FREE, 1, &param);
+ }
+=20
+ static void handle_rpc_func_cmd_shm_free(struct tee_context *ctx,
+@@ -326,10 +333,10 @@ static void handle_rpc_func_cmd_shm_free(struct tee_=
context *ctx,
+=20
+ 	shm =3D (struct tee_shm *)(unsigned long)arg->params[0].u.value.b;
+ 	switch (arg->params[0].u.value.a) {
+-	case OPTEE_MSG_RPC_SHM_TYPE_APPL:
++	case OPTEE_RPC_SHM_TYPE_APPL:
+ 		cmd_free_suppl(ctx, shm);
+ 		break;
+-	case OPTEE_MSG_RPC_SHM_TYPE_KERNEL:
++	case OPTEE_RPC_SHM_TYPE_KERNEL:
+ 		tee_shm_free(shm);
+ 		break;
+ 	default:
+@@ -357,7 +364,7 @@ static void handle_rpc_func_cmd(struct tee_context *ct=
x, struct optee *optee,
+ 				struct tee_shm *shm,
+ 				struct optee_call_ctx *call_ctx)
+ {
+-	struct optee_msg_arg *arg;
++	struct optee_msg_arg *arg =3D NULL;
+=20
+ 	arg =3D tee_shm_get_va(shm, 0);
+ 	if (IS_ERR(arg)) {
+@@ -366,24 +373,24 @@ static void handle_rpc_func_cmd(struct tee_context *=
ctx, struct optee *optee,
+ 	}
+=20
+ 	switch (arg->cmd) {
+-	case OPTEE_MSG_RPC_CMD_GET_TIME:
++	case OPTEE_RPC_CMD_GET_TIME:
+ 		handle_rpc_func_cmd_get_time(arg);
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_WAIT_QUEUE:
++	case OPTEE_RPC_CMD_WAIT_QUEUE:
+ 		handle_rpc_func_cmd_wq(optee, arg);
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_SUSPEND:
++	case OPTEE_RPC_CMD_SUSPEND:
+ 		handle_rpc_func_cmd_wait(arg);
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_SHM_ALLOC:
++	case OPTEE_RPC_CMD_SHM_ALLOC:
+ 		free_pages_list(call_ctx);
+ 		handle_rpc_func_cmd_shm_alloc(ctx, arg, call_ctx);
+ 		break;
+-	case OPTEE_MSG_RPC_CMD_SHM_FREE:
++	case OPTEE_RPC_CMD_SHM_FREE:
+ 		handle_rpc_func_cmd_shm_free(ctx, arg);
+ 		break;
+ 	default:
+-		handle_rpc_supp_cmd(ctx, arg);
++		handle_rpc_supp_cmd(ctx, optee, arg);
+ 	}
+ }
+=20
+@@ -441,3 +448,95 @@ void optee_handle_rpc(struct tee_context *ctx, struct=
 optee_rpc_param *param,
+=20
+ 	param->a0 =3D OPTEE_SMC_CALL_RETURN_FROM_RPC;
+ }
++
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++static void handle_ffa_rpc_func_cmd(struct tee_context *ctx,
++				     struct optee *optee,
++				     struct optee_msg_arg *arg)
++{
++	switch (arg->cmd) {
++	case OPTEE_RPC_CMD_GET_TIME:
++		handle_rpc_func_cmd_get_time(arg);
++		break;
++	case OPTEE_RPC_CMD_WAIT_QUEUE:
++		handle_rpc_func_cmd_wq(optee, arg);
++		break;
++	case OPTEE_RPC_CMD_SUSPEND:
++		handle_rpc_func_cmd_wait(arg);
++		break;
++	case OPTEE_RPC_CMD_SHM_ALLOC:
++	case OPTEE_RPC_CMD_SHM_FREE:
++		pr_err("%s: RPC cmd 0x%x: not supported\n", __func__,
++		       arg->cmd);
++		arg->ret =3D TEEC_ERROR_NOT_SUPPORTED;
++		break;
++	default:
++		handle_rpc_supp_cmd(ctx, optee, arg);
++	}
++}
++
++void optee_handle_ffa_rpc(struct tee_context *ctx, u32 *w4, u32 *w5, u32 =
*w6)
++{
++	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
++	struct tee_shm *shm =3D NULL;
++	struct optee_msg_arg *rpc_arg =3D NULL;
++	u64 global_handle =3D 0;
++	u32 cmd =3D *w4;
++
++	switch (cmd) {
++	case OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM:
++	case OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_SUPPL_SHM:
++		if (cmd =3D=3D OPTEE_FFA_YIELDING_CALL_RETURN_ALLOC_KERN_SHM)
++			shm =3D tee_shm_alloc(ctx, *w5 * PAGE_SIZE,
++					    TEE_SHM_MAPPED);
++		else
++			shm =3D cmd_alloc_suppl(ctx, *w5 * PAGE_SIZE);
++
++		if (IS_ERR_OR_NULL(shm))
++			break;
++
++		*w4 =3D shm->sec_world_id;
++		*w5 =3D shm->sec_world_id >> 32;
++		*w6 =3D shm->offset;
++		return;
++	case OPTEE_FFA_YIELDING_CALL_RETURN_FREE_KERN_SHM:
++	case OPTEE_FFA_YIELDING_CALL_RETURN_FREE_SUPPL_SHM:
++		global_handle =3D *w5 | ((u64)*w6 << 32);
++		shm =3D optee_shm_from_ffa_handle(optee, global_handle);
++		if (!shm) {
++			pr_err("Invalid global handle 0x%llx\n", global_handle);
++			break;
++		}
++		if (cmd =3D=3D OPTEE_FFA_YIELDING_CALL_RETURN_FREE_KERN_SHM)
++			tee_shm_free(shm);
++		else
++			cmd_free_suppl(ctx, shm);
++		break;
++	case OPTEE_FFA_YIELDING_CALL_RETURN_RPC_CMD:
++		global_handle =3D *w5 | ((u64)*w6 << 32);
++		shm =3D optee_shm_from_ffa_handle(optee, global_handle);
++		if (!shm) {
++			pr_err("Invalid global handle 0x%llx\n", global_handle);
++			break;
++		}
++		rpc_arg =3D tee_shm_get_va(shm, 0);
++		if (IS_ERR(rpc_arg)) {
++			pr_err("Invalid offset 0 for global handle 0x%llx\n",
++			       global_handle);
++			break;
++		}
++		handle_ffa_rpc_func_cmd(ctx, optee, rpc_arg);
++		break;
++	case OPTEE_FFA_YIELDING_CALL_RETURN_INTERRUPT:
++		/* Interrupt delivered by now */
++		break;
++	default:
++		pr_warn("Unknown RPC func 0x%x\n", cmd);
++		break;
++	}
++
++	*w4 =3D 0;
++	*w5 =3D 0;
++	*w6 =3D 0;
++}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
+diff --git a/drivers/tee/optee/shm_pool.c b/drivers/tee/optee/shm_pool.c
+index d767eebf30bd..ffc6821f6ce3 100644
+--- a/drivers/tee/optee/shm_pool.c
++++ b/drivers/tee/optee/shm_pool.c
+@@ -87,3 +87,53 @@ struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(voi=
d)
+=20
+ 	return mgr;
+ }
++
++#ifdef CONFIG_ARM_FFA_TRANSPORT
++static int pool_ffa_op_alloc(struct tee_shm_pool_mgr *poolm,
++			 struct tee_shm *shm, size_t size)
++{
++	unsigned int order =3D get_order(size);
++	struct page *page;
++	int rc =3D 0;
++
++	page =3D alloc_pages(GFP_KERNEL | __GFP_ZERO, order);
++	if (!page)
++		return -ENOMEM;
++
++	shm->kaddr =3D page_address(page);
++	shm->paddr =3D page_to_phys(page);
++	shm->size =3D PAGE_SIZE << order;
++
++	shm->flags |=3D TEE_SHM_REGISTER;
++	rc =3D optee_ffa_shm_register(shm->ctx, shm, &page, 1 << order,
++				     (unsigned long)shm->kaddr);
++
++	return rc;
++}
++
++static void pool_ffa_op_free(struct tee_shm_pool_mgr *poolm,
++			 struct tee_shm *shm)
++{
++	optee_ffa_shm_unregister(shm->ctx, shm);
++	free_pages((unsigned long)shm->kaddr, get_order(shm->size));
++	shm->kaddr =3D NULL;
++}
++
++static const struct tee_shm_pool_mgr_ops pool_ffa_ops =3D {
++	.alloc =3D pool_ffa_op_alloc,
++	.free =3D pool_ffa_op_free,
++	.destroy_poolmgr =3D pool_op_destroy_poolmgr,
++};
++
++struct tee_shm_pool_mgr *optee_ffa_shm_pool_alloc_pages(void)
++{
++	struct tee_shm_pool_mgr *mgr =3D kzalloc(sizeof(*mgr), GFP_KERNEL);
++
++	if (!mgr)
++		return ERR_PTR(-ENOMEM);
++
++	mgr->ops =3D &pool_ffa_ops;
++
++	return mgr;
++}
++#endif /*CONFIG_ARM_FFA_TRANSPORT*/
+diff --git a/drivers/tee/optee/shm_pool.h b/drivers/tee/optee/shm_pool.h
+index 28109d991c4b..34c5fd74a3ff 100644
+--- a/drivers/tee/optee/shm_pool.h
++++ b/drivers/tee/optee/shm_pool.h
+@@ -10,5 +10,6 @@
+ #include <linux/tee_drv.h>
+=20
+ struct tee_shm_pool_mgr *optee_shm_pool_alloc_pages(void);
++struct tee_shm_pool_mgr *optee_ffa_shm_pool_alloc_pages(void);
+=20
+ #endif
+diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
+index 3d32a2ca48c3..974fe7081225 100644
+--- a/drivers/tee/tee_core.c
++++ b/drivers/tee/tee_core.c
+@@ -59,7 +59,6 @@ static struct tee_context *teedev_open(struct tee_device=
 *teedev)
+=20
+ 	kref_init(&ctx->refcount);
+ 	ctx->teedev =3D teedev;
+-	INIT_LIST_HEAD(&ctx->list_shm);
+ 	rc =3D teedev->desc->ops->open(ctx);
+ 	if (rc)
+ 		goto err;
+diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
+index 09ddcd06c715..deb22f877881 100644
+--- a/drivers/tee/tee_shm.c
++++ b/drivers/tee/tee_shm.c
+@@ -13,13 +13,13 @@
+=20
+ static void tee_shm_release(struct tee_shm *shm)
+ {
+-	struct tee_device *teedev =3D shm->teedev;
++	struct tee_device *teedev =3D shm->ctx->teedev;
+=20
+-	mutex_lock(&teedev->mutex);
+-	idr_remove(&teedev->idr, shm->id);
+-	if (shm->ctx)
+-		list_del(&shm->link);
+-	mutex_unlock(&teedev->mutex);
++	if (shm->flags & TEE_SHM_DMA_BUF) {
++		mutex_lock(&teedev->mutex);
++		idr_remove(&teedev->idr, shm->id);
++		mutex_unlock(&teedev->mutex);
++	}
+=20
+ 	if (shm->flags & TEE_SHM_POOL) {
+ 		struct tee_shm_pool_mgr *poolm;
+@@ -44,8 +44,7 @@ static void tee_shm_release(struct tee_shm *shm)
+ 		kfree(shm->pages);
+ 	}
+=20
+-	if (shm->ctx)
+-		teedev_ctx_put(shm->ctx);
++	teedev_ctx_put(shm->ctx);
+=20
+ 	kfree(shm);
+=20
+@@ -82,7 +81,7 @@ static int tee_shm_op_mmap(struct dma_buf *dmabuf, struc=
t vm_area_struct *vma)
+ 	size_t size =3D vma->vm_end - vma->vm_start;
+=20
+ 	/* Refuse sharing shared memory provided by application */
+-	if (shm->flags & TEE_SHM_REGISTER)
++	if (shm->flags & TEE_SHM_USER_MAPPED)
+ 		return -EINVAL;
+=20
+ 	return remap_pfn_range(vma, vma->vm_start, shm->paddr >> PAGE_SHIFT,
+@@ -97,20 +96,14 @@ static const struct dma_buf_ops tee_shm_dma_buf_ops =
=3D {
+ 	.mmap =3D tee_shm_op_mmap,
+ };
+=20
+-static struct tee_shm *__tee_shm_alloc(struct tee_context *ctx,
+-				       struct tee_device *teedev,
+-				       size_t size, u32 flags)
++struct tee_shm *tee_shm_alloc(struct tee_context *ctx, size_t size, u32 f=
lags)
+ {
++	struct tee_device *teedev =3D ctx->teedev;
+ 	struct tee_shm_pool_mgr *poolm =3D NULL;
+ 	struct tee_shm *shm;
+ 	void *ret;
+ 	int rc;
+=20
+-	if (ctx && ctx->teedev !=3D teedev) {
+-		dev_err(teedev->dev.parent, "ctx and teedev mismatch\n");
+-		return ERR_PTR(-EINVAL);
+-	}
+-
+ 	if (!(flags & TEE_SHM_MAPPED)) {
+ 		dev_err(teedev->dev.parent,
+ 			"only mapped allocations supported\n");
+@@ -138,7 +131,6 @@ static struct tee_shm *__tee_shm_alloc(struct tee_cont=
ext *ctx,
+ 	}
+=20
+ 	shm->flags =3D flags | TEE_SHM_POOL;
+-	shm->teedev =3D teedev;
+ 	shm->ctx =3D ctx;
+ 	if (flags & TEE_SHM_DMA_BUF)
+ 		poolm =3D teedev->pool->dma_buf_mgr;
+@@ -151,17 +143,18 @@ static struct tee_shm *__tee_shm_alloc(struct tee_co=
ntext *ctx,
+ 		goto err_kfree;
+ 	}
+=20
+-	mutex_lock(&teedev->mutex);
+-	shm->id =3D idr_alloc(&teedev->idr, shm, 1, 0, GFP_KERNEL);
+-	mutex_unlock(&teedev->mutex);
+-	if (shm->id < 0) {
+-		ret =3D ERR_PTR(shm->id);
+-		goto err_pool_free;
+-	}
+=20
+ 	if (flags & TEE_SHM_DMA_BUF) {
+ 		DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+=20
++		mutex_lock(&teedev->mutex);
++		shm->id =3D idr_alloc(&teedev->idr, shm, 1, 0, GFP_KERNEL);
++		mutex_unlock(&teedev->mutex);
++		if (shm->id < 0) {
++			ret =3D ERR_PTR(shm->id);
++			goto err_pool_free;
++		}
++
+ 		exp_info.ops =3D &tee_shm_dma_buf_ops;
+ 		exp_info.size =3D shm->size;
+ 		exp_info.flags =3D O_RDWR;
+@@ -174,18 +167,16 @@ static struct tee_shm *__tee_shm_alloc(struct tee_co=
ntext *ctx,
+ 		}
+ 	}
+=20
+-	if (ctx) {
++	if (ctx)
+ 		teedev_ctx_get(ctx);
+-		mutex_lock(&teedev->mutex);
+-		list_add_tail(&shm->link, &ctx->list_shm);
+-		mutex_unlock(&teedev->mutex);
+-	}
+=20
+ 	return shm;
+ err_rem:
+-	mutex_lock(&teedev->mutex);
+-	idr_remove(&teedev->idr, shm->id);
+-	mutex_unlock(&teedev->mutex);
++	if (flags & TEE_SHM_DMA_BUF) {
++		mutex_lock(&teedev->mutex);
++		idr_remove(&teedev->idr, shm->id);
++		mutex_unlock(&teedev->mutex);
++	}
+ err_pool_free:
+ 	poolm->ops->free(poolm, shm);
+ err_kfree:
+@@ -194,31 +185,8 @@ static struct tee_shm *__tee_shm_alloc(struct tee_con=
text *ctx,
+ 	tee_device_put(teedev);
+ 	return ret;
+ }
+-
+-/**
+- * tee_shm_alloc() - Allocate shared memory
+- * @ctx:	Context that allocates the shared memory
+- * @size:	Requested size of shared memory
+- * @flags:	Flags setting properties for the requested shared memory.
+- *
+- * Memory allocated as global shared memory is automatically freed when t=
he
+- * TEE file pointer is closed. The @flags field uses the bits defined by
+- * TEE_SHM_* in <linux/tee_drv.h>. TEE_SHM_MAPPED must currently always b=
e
+- * set. If TEE_SHM_DMA_BUF global shared memory will be allocated and
+- * associated with a dma-buf handle, else driver private memory.
+- */
+-struct tee_shm *tee_shm_alloc(struct tee_context *ctx, size_t size, u32 f=
lags)
+-{
+-	return __tee_shm_alloc(ctx, ctx->teedev, size, flags);
+-}
+ EXPORT_SYMBOL_GPL(tee_shm_alloc);
+=20
+-struct tee_shm *tee_shm_priv_alloc(struct tee_device *teedev, size_t size=
)
+-{
+-	return __tee_shm_alloc(NULL, teedev, size, TEE_SHM_MAPPED);
+-}
+-EXPORT_SYMBOL_GPL(tee_shm_priv_alloc);
+-
+ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long a=
ddr,
+ 				 size_t length, u32 flags)
+ {
+@@ -251,7 +219,6 @@ struct tee_shm *tee_shm_register(struct tee_context *c=
tx, unsigned long addr,
+ 	}
+=20
+ 	shm->flags =3D flags | TEE_SHM_REGISTER;
+-	shm->teedev =3D teedev;
+ 	shm->ctx =3D ctx;
+ 	shm->id =3D -1;
+ 	addr =3D untagged_addr(addr);
+@@ -307,10 +274,6 @@ struct tee_shm *tee_shm_register(struct tee_context *=
ctx, unsigned long addr,
+ 		}
+ 	}
+=20
+-	mutex_lock(&teedev->mutex);
+-	list_add_tail(&shm->link, &ctx->list_shm);
+-	mutex_unlock(&teedev->mutex);
+-
+ 	return shm;
+ err:
+ 	if (shm) {
+diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
+index 545a57f61a5e..407c27c11b2b 100644
+--- a/include/linux/tee_drv.h
++++ b/include/linux/tee_drv.h
+@@ -49,7 +49,6 @@ struct tee_shm_pool;
+  */
+ struct tee_context {
+ 	struct tee_device *teedev;
+-	struct list_head list_shm;
+ 	void *data;
+ 	struct kref refcount;
+ 	bool releasing;
+@@ -184,9 +183,7 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 con=
nection_method,
+=20
+ /**
+  * struct tee_shm - shared memory object
+- * @teedev:	device used to allocate the object
+- * @ctx:	context using the object, if NULL the context is gone
+- * @link	link element
++ * @ctx:	context using the object
+  * @paddr:	physical address of the shared memory
+  * @kaddr:	virtual address of the shared memory
+  * @size:	size of shared memory
+@@ -195,15 +192,17 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 c=
onnection_method,
+  * @num_pages:	number of locked pages
+  * @dmabuf:	dmabuf used to for exporting to user space
+  * @flags:	defined by TEE_SHM_* in tee_drv.h
+- * @id:		unique id of a shared memory object on this device
++ * @id:		unique id of a shared memory object on this device, shared
++ *		with user space
++ * @sec_world_id:
++ *		secure world assigned id of this shared memory object, not
++ *		used by all drivers
+  *
+  * This pool is only supposed to be accessed directly from the TEE
+  * subsystem and from drivers that implements their own shm pool manager.
+  */
+ struct tee_shm {
+-	struct tee_device *teedev;
+ 	struct tee_context *ctx;
+-	struct list_head link;
+ 	phys_addr_t paddr;
+ 	void *kaddr;
+ 	size_t size;
+@@ -213,6 +212,7 @@ struct tee_shm {
+ 	struct dma_buf *dmabuf;
+ 	u32 flags;
+ 	int id;
++	u64 sec_world_id;
+ };
+=20
+ /**
+@@ -334,18 +334,6 @@ void *tee_get_drvdata(struct tee_device *teedev);
+  */
+ struct tee_shm *tee_shm_alloc(struct tee_context *ctx, size_t size, u32 f=
lags);
+=20
+-/**
+- * tee_shm_priv_alloc() - Allocate shared memory privately
+- * @dev:	Device that allocates the shared memory
+- * @size:	Requested size of shared memory
+- *
+- * Allocates shared memory buffer that is not associated with any client
+- * context. Such buffers are owned by TEE driver and used for internal ca=
lls.
+- *
+- * @returns a pointer to 'struct tee_shm'
+- */
+-struct tee_shm *tee_shm_priv_alloc(struct tee_device *teedev, size_t size=
);
+-
+ /**
+  * tee_shm_register() - Register shared memory buffer
+  * @ctx:	Context that registers the shared memory
+--=20
+2.26.2
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0013=
-tee-optee-fix-mem-handle-removal-in-ffa_shm_unregist.patch b/meta-arm-bsp/=
recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0013-tee-optee-fix-mem-handle-=
removal-in-ffa_shm_unregist.patch
new file mode 100644
index 0000000..ad2c945
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm64-ack-5.4/tc0/0013-tee-op=
tee-fix-mem-handle-removal-in-ffa_shm_unregist.patch
@@ -0,0 +1,51 @@
+From 957e0145899813017a6a2b7f863a4a2b4e4b75aa Mon Sep 17 00:00:00 2001
+From: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Date: Tue, 5 Jan 2021 09:27:41 +0000
+Subject: [PATCH] tee: optee: fix mem handle removal in ffa_shm_unregister
+
+Remove ffa memory handle before calling mem_reclaim. This enables the
+handle to be re-used by another thread once mem_claim for that handle
+is completed.
+
+Signed-off-by: Arunachalam Ganapathy <arunachalam.ganapathy@arm.com>
+Change-Id: I7294bd71f2bbc28514eaa09ae757dd216bc7df45
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+---
+ drivers/tee/optee/call.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
+index ac89ab42a43f..9c9480add0b5 100644
+--- a/drivers/tee/optee/call.c
++++ b/drivers/tee/optee/call.c
+@@ -843,6 +843,10 @@ int optee_ffa_shm_unregister_supp(struct tee_context =
*ctx,
+ {
+ 	struct optee *optee =3D tee_get_drvdata(ctx->teedev);
+ 	int rc =3D 0;
++	u64 handle =3D shm->sec_world_id;
++
++	optee_shm_rem_ffa_handle(optee, handle);
++	shm->sec_world_id =3D 0;
+=20
+ 	/*
+ 	 * We're skipping the OPTEE_FFA_YIELDING_CALL_UNREGISTER_SHM call
+@@ -850,14 +854,10 @@ int optee_ffa_shm_unregister_supp(struct tee_context=
 *ctx,
+ 	 * this ID.
+ 	 */
+=20
+-	rc =3D optee->ffa.ops->mem_reclaim(shm->sec_world_id, 0);
++	rc =3D optee->ffa.ops->mem_reclaim(handle, 0);
+ 	if (rc)
+ 		pr_err("mem_reclain: %d", rc);
+=20
+-	optee_shm_rem_ffa_handle(optee, shm->sec_world_id);
+-
+-	shm->sec_world_id =3D 0;
+-
+ 	return rc;
+ }
+ #endif /*CONFIG_ARM_FFA_TRANSPORT*/
+--=20
+2.26.2
+
--=20
2.29.2

