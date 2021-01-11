Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.79])
 by mx.groups.io with SMTP id smtpd.web11.34864.1610376305657343751
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jan 2021 06:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7KaJefQA;
 spf=pass (domain: arm.com, ip: 40.107.13.79, mailfrom: khasim.mohammed@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nFWQWKuDNNFl7YM1AzqKJnKWSc+h7kEe1me7JpyONU=;
 b=7KaJefQA2kC6+OBpLkYDfuQw3xVmTjwWdbnDD9FOow6Wf/PA/y33+dGp7oXr4z7JIKGDZM3ZnbvNAjhgp6wfbHZhsW2Ect6udMMJy3as4TzWgGdsktkhUDyYMwFo/DxLukxkhHUMss94Nt3m44Stc803SoA1kolynsWU5Lq6L3E=
Received: from DB6PR0202CA0017.eurprd02.prod.outlook.com (2603:10a6:4:29::27)
 by DB8PR08MB4956.eurprd08.prod.outlook.com (2603:10a6:10:e0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 14:45:02 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::39) by DB6PR0202CA0017.outlook.office365.com
 (2603:10a6:4:29::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 14:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 14:45:02 +0000
Received: ("Tessian outbound af289585f0f4:v71"); Mon, 11 Jan 2021 14:45:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d53a41994edc7ec
X-CR-MTA-TID: 64aa7808
Received: from 6191dabb2fad.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E6255632-B171-461F-A085-F2C3E718E162.1;
	Mon, 11 Jan 2021 14:44:56 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6191dabb2fad.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 11 Jan 2021 14:44:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ziunf1HytS8yL2SlB0JqMjC228Sz42TLvDaXHw1GZztAknyElmi/mJiT1k7HbkF7wuY/HV6gObe+wdMPMdQS1oVTQmfVJCD3Dc+QH6kTErkA/kkd9DA3uTmlp+fSAfBbrSklaEF6s5QHYiptrl+Hd1xGD4/ljd+Xa1Mz50QAgXdt2DrAthC+Qtxrgo5gmwEG6gMePpdcZwSYCxuQtnRdHQAN2vLLZIaVv5dVfgW9ua4KNqCJtNvKtYMrP+3itPw2uzO/EfwsqSsk1ksNBTcvXNTCEo1CZaw26gcCc6HYQcMrcF/spOORL1NRzDhih+T9jx9fwgG+ku+M2jesUODXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nFWQWKuDNNFl7YM1AzqKJnKWSc+h7kEe1me7JpyONU=;
 b=VYjs5KJN1THOgBhVsmTNT+mNWYjgiq0PH6kA2Hy2lbaw5Q4pZlfYgSBBy0Sd3vuy4Y4SWLe4DSeXDsHXWBIrHw9QtT0hL7yrHJKcWIiV3ip5/8mB2CpI7aMUdF46ZepHYOoWSY8vKMmzjvY23mh7BEq8KUwyRe8daVfEODE3ZQMtN5rt4jRe2gRA4b5ckEF3sU4uGLU8suuPP9PejPnSbkGfxHK/3dgZEHkTuMgRaKwIPHmx7dTYzGwy8PkuWWglaf/t4pEUDrI72FGXMqs3TUHktXKN2xjhhGFT8fdchbKsHxk3/bjGCliq4Hok4Sc6pKum7z2uG++FspQqXZuX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nFWQWKuDNNFl7YM1AzqKJnKWSc+h7kEe1me7JpyONU=;
 b=7KaJefQA2kC6+OBpLkYDfuQw3xVmTjwWdbnDD9FOow6Wf/PA/y33+dGp7oXr4z7JIKGDZM3ZnbvNAjhgp6wfbHZhsW2Ect6udMMJy3as4TzWgGdsktkhUDyYMwFo/DxLukxkhHUMss94Nt3m44Stc803SoA1kolynsWU5Lq6L3E=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com (2603:10a6:802:ae::22)
 by VE1PR08MB5712.eurprd08.prod.outlook.com (2603:10a6:800:1a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 14:44:54 +0000
Received: from VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::2505:301:62b:1ed2]) by VE1PR08MB4846.eurprd08.prod.outlook.com
 ([fe80::2505:301:62b:1ed2%6]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 14:44:54 +0000
From: "Khasim Mohammed" <khasim.mohammed@arm.com>
To: meta-arm@lists.yoctoproject.org
CC: nd@arm.com,
	Khasim Syed Mohammed <khasim.mohammed@arm.com>
Subject: [PATCH] arm-bsp/n1sdp: port and migrate to linux yocto kernel 5.10
Date: Mon, 11 Jan 2021 20:14:21 +0530
Message-ID: <20210111144421.7118-1-khasim.mohammed@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.105.55]
X-ClientProxiedBy: BM1PR0101CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::31) To VE1PR08MB4846.eurprd08.prod.outlook.com
 (2603:10a6:802:ae::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e116623.arm.com (217.140.105.55) by BM1PR0101CA0021.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 14:44:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b2218593-e633-4752-c9d8-08d8b63f7a26
X-MS-TrafficTypeDiagnostic: VE1PR08MB5712:|DB8PR08MB4956:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB495679AB1EE4C932B5B6FDB4FAAB0@DB8PR08MB4956.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oJv35GiVJeA5RhaoFBMafqU9W20QAwC/Dg7UlwxVJPWYolb3BkUh8VnX/Oz9B2XMU7eMvIB2wsTMSOqXwBc26/s0i7GsaJSnL0KQ4xddTwjHSJj6rBfzLqmo7taCTdgrHvidMMfovsqwp6KQVMb3XHZ/xp6oyTNA+SwhNGuKdJf9i6q8JUPD8yxnGeMX9/NQkgSxKbHo1od/aaS3xmWFKCR9j15W4+KJcYZYpFXL2JotPvFFOOjBMJ2tmHJ8as8OSWxtxJiycRdb4inBQS6RDwqdd5hpBpVVfSbdaFOtZVi4EFfgZN1RbZIEVVUGLU7vnOYtvqYBgwb5jX0BwpU8thSOaEUEJ9rOTi/9GThxIBA+86VmPvBlHMkpGVyhzDSJThn32bdUwl3lkZV5poGrbT4QCv82a/KETDNBWPF5kYS3VGf8FZ8gsdPiQuJLL/bjSg391C+IZtfspaz+mQr4MfhuH0y2AR8uEZDuWbTmHBqFxD7oqpNOeYplh6Zml2MHYbFnCtTy2PSQE54OVC0yQfNo10qy/adR/72/gwLEnj8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4846.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(478600001)(316002)(86362001)(8676002)(956004)(6666004)(66556008)(66476007)(66946007)(8936002)(83380400001)(30864003)(6916009)(2616005)(5660300002)(26005)(6486002)(4326008)(7696005)(52116002)(16526019)(186003)(36756003)(1076003)(2906002)(19627235002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dUI4N1lLVWM2K2x3T3dKWis1YVlaUWFuYUFuNTNvZXVja2U3eUFXdmpkbFAw?=
 =?utf-8?B?WFVNL3R0RnNza3l5NXlST2Izckwzdkw0WXQ4b0R1OXh3czd5emN0Y2ZpTksx?=
 =?utf-8?B?VnFPTW9kV3l0c2txNTZERCtOWE1GZENSQmpNS2cyR1h4Q2ZwKytQNEVKd1pk?=
 =?utf-8?B?UlFVbVNuUzdnbGcwNlN2Vk5Cay82dWtUZVpZMnM0akV3ZXN3L0pXdm0wL0c4?=
 =?utf-8?B?TzhzNXZDZHRtZWJTSytPTURVaklJZzM1QTdVejhuTDcxbnNJMWVCU21kNTNn?=
 =?utf-8?B?WUhhUHo5SmdJNmZVSEFyMFc1b0Y2aUdUbytnNmsra1RlOCszb29DdjFnQ2s1?=
 =?utf-8?B?Yko4R2ZQbEVsTTJ2N21vN3FXOXFCa0xhTFNVOU1LUHBxbUpTMmpla214Zllq?=
 =?utf-8?B?OUh2bXgwSFpuY3lpRER2a0R2aElsckord2V6a3lJb1JZanZJbmRBb1JyU0h6?=
 =?utf-8?B?dEVVVTQyM3lZdWhYS0crY21MU1V3WW5QUStBVGp3T2k4OVpORUV3NTBodVJo?=
 =?utf-8?B?alNNUTNrZ09JYUNOMVllQ1RacUhPaTByRE5NT2Rqai8xdFduY2RLSituRU9X?=
 =?utf-8?B?Yi9XWFUzV0JjczhkYUFsWlJwVDNTN2lqTmUzUExpcWxwaFhQWVB2UjRMempU?=
 =?utf-8?B?YjdzUWJDWmtWWE9rSG5wQzY5UUNHSVpMRlN6b242ZEQ1U3p6QlZVT0Q0VGgr?=
 =?utf-8?B?WTF5Vzd6N2VmOWF2NzEyZmZocGxGaWJHVEpDb1JlaVNRMXh1ZXpxdG5QNzA4?=
 =?utf-8?B?aGVnZ2hhN0V4eHdOcC85R0RpOFBKblU2ZFpvTVRSSVNnNzUvMnF5STdVSi9M?=
 =?utf-8?B?bS9JOHdPbnFlblg5ZVk3U2xHTXNETjVWTkw3WTNxVGtNVEFBM1IrODM5eVht?=
 =?utf-8?B?ZHlsZXdIL1hmRXVHc3Jjb1g1WGxLTTU0eERwbTVTNUZMU2xDK21QWTllQ0Nm?=
 =?utf-8?B?TVZvTDhpTStSdHhBbVltMERoYUVhWjFFOWkvVnBhb2xBNmtueFRkMVNjZzc0?=
 =?utf-8?B?cmxpR3lVUS9MblZVSHAyZkZQY3NCTG1wRWlWTWhjWlFLYm9tamtNTmdqekdJ?=
 =?utf-8?B?djdZVERlNU9iVnNnd01LN1pTb3M4Y1l5TjY2OGNLL0FXMHlGL1hha1Fzckc2?=
 =?utf-8?B?aGVidkpqRENFdWpkY3FIaksyUEt4S2xJMVdkSTVOTkJUbFdOdjdpMTRuYVlP?=
 =?utf-8?B?c1ZLdW9BbGJ3TzdWZ2xtK3JzNGVuT3dBRk94MHJnSGlTYmd5SFBWREF4eEJw?=
 =?utf-8?B?SWNpUUNuRk85SjM0RC8yT0RKQURvQ0VDMlRKOWlndFBIQVd1b1g2Z3BuR2ho?=
 =?utf-8?Q?BECAv6C0TV86qZgpTuhJJKZGzQj+NIKLKg?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5712
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Khasim.Mohammed@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b7cbb41e-f25b-4430-f8ac-08d8b63f75c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5n/Jn5Dy9iUDosPGqcDIdNP++vgKJh3OR2nohXLRD7K2PttmG5Xi12ON+HH2GWAqt0kdWc4uXxwzegDMZM4RTAeKzDJFP+LEeO2A7Ch1w5w6uW6n/45hBXdItOYMRbG1azImjpOV2bM6+5eo+uGmtmj1dZAL2zSP8IDeqg0iwtkiGPx660gVEczxBExvMziu4GPtrJsEGy6JVbkBugcuwL+T1iCaSpguLASC7/Wm8tQ7bLmK0aGuDTVULBmId5Y82ipR9dd3IjwHv8nq/76JMAF/CYrhqgPiwYzE0gYjDXjFwKCDGkqp7tpkuc9vhreURpAUggQUE4rWSMSNEb+RT7UmT2TE4jW3AlO0vQiAADTb1Ol8TM04xhLwqZGyvNR6SkYokw3fRA445IHCHu7tduXxMQQVEWcvDnKCCtTddUqPkS84g/COTp3qtMBG2ATWMf63nMR0WX1DFZD5rhAvtePuqtCDxDuqJx9SnaKxda2ejq0QHFqK4ki+4GFVXZE6WtJNomcrh3L4QsV8Goa+hnBjMQF43CwHTMCNGn53TyvQKiQXJ9APbg2C3tlcBlSYnDbL5sAxNY5DVZ5htq9P4uwM5VX4wF0bNoix3jZ79sY9CqsnP6+2iVYJrGfYGt06
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(8676002)(5660300002)(83380400001)(47076005)(6916009)(86362001)(7696005)(26005)(82310400003)(34020700004)(30864003)(478600001)(16526019)(2616005)(956004)(81166007)(36756003)(82740400003)(6486002)(6666004)(19627235002)(2906002)(356005)(186003)(70586007)(8936002)(316002)(4326008)(336012)(70206006)(1076003)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 14:45:02.1392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2218593-e633-4752-c9d8-08d8b63f7a26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4956
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This commit includes :
    - rebased and fixed kernel 5.4 PCIe quirk patches to apply on 5.10
    - pci probe in n1sdp driver is modified to use 5.10 structure
    - USB_CON_GPIO config is added to remove build time warning
    - Updated n1sdp conf to use 5.10 yocto kernel

Change-Id: I9e3d3945057ac09768a4a4e4d7a3033138925955
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
---
 meta-arm-bsp/conf/machine/n1sdp.conf          |   6 +-
 .../linux/linux-arm-platforms.inc             |  17 +
 ...irk-add-acs-override-for-PCI-devices.patch | 161 +++++++++
 ...-for-the-Arm-Neoverse-N1SDP-platform.patch | 329 ++++++++++++++++++
 ...e-n1sdp-pci-quirk-for-SR-IOV-support.patch |  58 +++
 ...uirk-support-enabling-remote-chip-PC.patch | 137 ++++++++
 ...id-duplicate-sysfs-entry-creation-er.patch |  45 +++
 .../n1sdp/enable-realtek-R8169.cfg            |   3 +
 .../n1sdp/enable-usb_conn_gpio.cfg            |   2 +
 9 files changed, 755 insertions(+), 3 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sd=
p/0001-pci_quirk-add-acs-override-for-PCI-devices.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sd=
p/0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sd=
p/0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sd=
p/0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sd=
p/0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sd=
p/enable-realtek-R8169.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sd=
p/enable-usb_conn_gpio.cfg

diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machi=
ne/n1sdp.conf
index 67363ac..0fc4bb8 100644
--- a/meta-arm-bsp/conf/machine/n1sdp.conf
+++ b/meta-arm-bsp/conf/machine/n1sdp.conf
@@ -17,9 +17,9 @@ WKS_FILE ?=3D "n1sdp-efidisk.wks"
 IMAGE_EFI_BOOT_FILES ?=3D "n1sdp-multi-chip.dtb n1sdp-single-chip.dtb"
 WKS_FILE_DEPENDS_append =3D " ${EXTRA_IMAGEDEPENDS}"
=20
-# Use kernel provided by linaro (Contains support for SCMi or HDMI)
-PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-linaro-arm"
-PREFERRED_VERSION_linux-linaro-arm ?=3D "5.4%"
+# Use kernel provided by yocto
+PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
+PREFERRED_VERSION_linux-yocto ?=3D "5.10%"
=20
 # RTL8168E Gigabit Ethernet Controller is attached to the PCIe interface
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "linux-firmware-rtl8168"
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/me=
ta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 1c9fdc1..7faabb2 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -78,6 +78,23 @@ SRC_URI_append_tc0 =3D " \
     file://0008-cpufreq-arm_scmi-Set-fast_switch_possible-conditiona.patch=
 \
     "
=20
+#
+# N1SDP KMACHINE
+#
+FILESEXTRAPATHS_prepend_n1sdp :=3D "${THISDIR}/linux-yocto-5.10/n1sdp:"
+COMPATIBLE_MACHINE_n1sdp =3D "n1sdp"
+KBUILD_DEFCONFIG_n1sdp =3D "defconfig"
+KCONFIG_MODE_n1sdp =3D "--alldefconfig"
+SRC_URI_append_n1sdp =3D " \
+    file://0001-pci_quirk-add-acs-override-for-PCI-devices.patch \
+    file://0002-pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch \
+    file://0003-n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch \
+    file://0004-n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch=
 \
+    file://0005-r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch=
 \
+    file://enable-realtek-R8169.cfg \
+    file://enable-usb_conn_gpio.cfg \
+    "
+
 #
 # Musca B1/S2 can't run Linux
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-=
pci_quirk-add-acs-override-for-PCI-devices.patch b/meta-arm-bsp/recipes-ker=
nel/linux/linux-yocto-5.10/n1sdp/0001-pci_quirk-add-acs-override-for-PCI-de=
vices.patch
new file mode 100644
index 0000000..aa4e9e4
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0001-pci_qui=
rk-add-acs-override-for-PCI-devices.patch
@@ -0,0 +1,161 @@
+From cfe5f638279e99cfc991cb38635cb9083c71f1e2 Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Mon, 4 Jan 2021 18:03:00 +0000
+Subject: [PATCH 1/4] pci_quirk: add acs override for PCI devices
+
+Upstream-Status: Inappropriate [will not be submitted as its an hack requi=
red to fix the hardware issue]
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+Patch taken from:
+https://gitlab.com/Queuecumber/linux-acs-override/raw/master/workspaces/5.=
4/acso.patch
+
+Signed-off-by: Manoj Kumar <manoj.kumar3@arm.com>
+---
+ .../admin-guide/kernel-parameters.txt         |   9 ++
+ drivers/pci/quirks.c                          | 102 ++++++++++++++++++
+ 2 files changed, 111 insertions(+)
+
+diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentati=
on/admin-guide/kernel-parameters.txt
+index 44fde25bb221..866a8eac8c3f 100644
+--- a/Documentation/admin-guide/kernel-parameters.txt
++++ b/Documentation/admin-guide/kernel-parameters.txt
+@@ -3629,6 +3629,15 @@
+ 		nomsi		[MSI] If the PCI_MSI kernel config parameter is
+ 				enabled, this kernel boot option can be used to
+ 				disable the use of MSI interrupts system-wide.
++		pcie_acs_override =3D
++					[PCIE] Override missing PCIe ACS support for:
++				downstream
++					All downstream ports - full ACS capabilities
++				multfunction
++					All multifunction devices - multifunction ACS subset
++				id:nnnn:nnnn
++					Specfic device - full ACS capabilities
++					Specified as vid:did (vendor/device ID) in hex
+ 		noioapicquirk	[APIC] Disable all boot interrupt quirks.
+ 				Safety option to keep boot IRQs enabled. This
+ 				should never be necessary.
+diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
+index f70692ac79c5..bc758323c8f3 100644
+--- a/drivers/pci/quirks.c
++++ b/drivers/pci/quirks.c
+@@ -3557,6 +3557,107 @@ static void quirk_no_bus_reset(struct pci_dev *dev=
)
+ 	dev->dev_flags |=3D PCI_DEV_FLAGS_NO_BUS_RESET;
+ }
+=20
++static bool acs_on_downstream;
++static bool acs_on_multifunction;
++
++#define NUM_ACS_IDS 16
++struct acs_on_id {
++	unsigned short vendor;
++	unsigned short device;
++};
++static struct acs_on_id acs_on_ids[NUM_ACS_IDS];
++static u8 max_acs_id;
++
++static __init int pcie_acs_override_setup(char *p)
++{
++	if (!p)
++		return -EINVAL;
++
++	while (*p) {
++		if (!strncmp(p, "downstream", 10))
++			acs_on_downstream =3D true;
++		if (!strncmp(p, "multifunction", 13))
++			acs_on_multifunction =3D true;
++		if (!strncmp(p, "id:", 3)) {
++			char opt[5];
++			int ret;
++			long val;
++
++			if (max_acs_id >=3D NUM_ACS_IDS - 1) {
++				pr_warn("Out of PCIe ACS override slots (%d)\n",
++						NUM_ACS_IDS);
++				goto next;
++			}
++
++			p +=3D 3;
++			snprintf(opt, 5, "%s", p);
++			ret =3D kstrtol(opt, 16, &val);
++			if (ret) {
++				pr_warn("PCIe ACS ID parse error %d\n", ret);
++				goto next;
++			}
++			acs_on_ids[max_acs_id].vendor =3D val;
++
++			p +=3D strcspn(p, ":");
++			if (*p !=3D ':') {
++				pr_warn("PCIe ACS invalid ID\n");
++				goto next;
++			}
++
++			p++;
++			snprintf(opt, 5, "%s", p);
++			ret =3D kstrtol(opt, 16, &val);
++			if (ret) {
++				pr_warn("PCIe ACS ID parse error %d\n", ret);
++				goto next;
++			}
++			acs_on_ids[max_acs_id].device =3D val;
++			max_acs_id++;
++		}
++next:
++		p +=3D strcspn(p, ",");
++		if (*p =3D=3D ',')
++			p++;
++	}
++
++	if (acs_on_downstream || acs_on_multifunction || max_acs_id)
++		pr_warn("Warning: PCIe ACS overrides enabled; This may allow non-IOMMU =
protected peer-to-peer DMA\n");
++
++	return 0;
++}
++early_param("pcie_acs_override", pcie_acs_override_setup);
++
++static int pcie_acs_overrides(struct pci_dev *dev, u16 acs_flags)
++{
++	int i;
++
++	/* Never override ACS for legacy devices or devices with ACS caps */
++	if (!pci_is_pcie(dev) ||
++		pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ACS))
++			return -ENOTTY;
++
++	for (i =3D 0; i < max_acs_id; i++)
++		if (acs_on_ids[i].vendor =3D=3D dev->vendor &&
++			acs_on_ids[i].device =3D=3D dev->device)
++				return 1;
++
++	switch (pci_pcie_type(dev)) {
++	case PCI_EXP_TYPE_DOWNSTREAM:
++	case PCI_EXP_TYPE_ROOT_PORT:
++		if (acs_on_downstream)
++			return 1;
++		break;
++	case PCI_EXP_TYPE_ENDPOINT:
++	case PCI_EXP_TYPE_UPSTREAM:
++	case PCI_EXP_TYPE_LEG_END:
++	case PCI_EXP_TYPE_RC_END:
++		if (acs_on_multifunction && dev->multifunction)
++			return 1;
++	}
++
++	return -ENOTTY;
++}
++
+ /*
+  * Some Atheros AR9xxx and QCA988x chips do not behave after a bus reset.
+  * The device will throw a Link Down error on AER-capable systems and
+@@ -4769,6 +4870,7 @@ static const struct pci_dev_acs_enabled {
+ 	{ PCI_VENDOR_ID_ZHAOXIN, 0x9083, pci_quirk_mf_endpoint_acs },
+ 	/* Zhaoxin Root/Downstream Ports */
+ 	{ PCI_VENDOR_ID_ZHAOXIN, PCI_ANY_ID, pci_quirk_zhaoxin_pcie_ports_acs },
++	{ PCI_ANY_ID, PCI_ANY_ID, pcie_acs_overrides },
+ 	{ 0 }
+ };
+=20
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-=
pcie-Add-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Add-quirk-for-the-Arm-Ne=
overse-N1SDP-platform.patch
new file mode 100644
index 0000000..7b35e3b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0002-pcie-Ad=
d-quirk-for-the-Arm-Neoverse-N1SDP-platform.patch
@@ -0,0 +1,329 @@
+From 5b9fd8da4deaabcd854c49286bf5c57c661e122f Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Mon, 4 Jan 2021 18:34:46 +0000
+Subject: [PATCH 2/4] pcie: Add quirk for the Arm Neoverse N1SDP platform
+
+Upstream-Status: Inappropriate [will not be submitted as its an hack requi=
red to fix the hardware issue]
+
+The patch is taken from :
+https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tree=
/linux
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+The Arm N1SDP SoC suffers from some PCIe integration issues, most
+prominently config space accesses to not existing BDFs being answered
+with a bus abort, resulting in an SError.
+To mitigate this, the firmware scans the bus before boot (catching the
+SErrors) and creates a table with valid BDFs, which acts as a filter for
+Linux' config space accesses.
+
+Add code consulting the table as an ACPI PCIe quirk, also register the
+corresponding device tree based description of the host controller.
+Also fix the other two minor issues on the way, namely not being fully
+ECAM compliant and config space accesses being restricted to 32-bit
+accesses only.
+
+This allows the Arm Neoverse N1SDP board to boot Linux without crashing
+and to access *any* devices (there are no platform devices except UART).
+
+Signed-off-by: Deepak Pandey <Deepak.Pandey@arm.com>
+[Sudipto: extend to cover the CCIX root port as well]
+Signed-off-by: Sudipto Paul <sudipto.paul@arm.com>
+[Andre: fix coding style issues, rewrite some parts, add DT support]
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+[Khasim: port the patch to linux kernel 5.10]
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+---
+ arch/arm64/configs/defconfig        |   1 +
+ drivers/acpi/pci_mcfg.c             |   7 +
+ drivers/pci/controller/Kconfig      |  11 ++
+ drivers/pci/controller/Makefile     |   1 +
+ drivers/pci/controller/pcie-n1sdp.c | 198 ++++++++++++++++++++++++++++
+ include/linux/pci-ecam.h            |   2 +
+ 6 files changed, 220 insertions(+)
+ create mode 100644 drivers/pci/controller/pcie-n1sdp.c
+
+diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
+index 5cfe3cf6f2ac..a035dcd7055d 100644
+--- a/arch/arm64/configs/defconfig
++++ b/arch/arm64/configs/defconfig
+@@ -205,6 +205,7 @@ CONFIG_NFC_NCI=3Dm
+ CONFIG_NFC_S3FWRN5_I2C=3Dm
+ CONFIG_PCI=3Dy
+ CONFIG_PCIEPORTBUS=3Dy
++CONFIG_PCI_QUIRKS=3Dy
+ CONFIG_PCI_IOV=3Dy
+ CONFIG_PCI_PASID=3Dy
+ CONFIG_HOTPLUG_PCI=3Dy
+diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
+index 95f23acd5b80..f7a7d6e87780 100644
+--- a/drivers/acpi/pci_mcfg.c
++++ b/drivers/acpi/pci_mcfg.c
+@@ -143,6 +143,13 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
+ 	XGENE_V2_ECAM_MCFG(4, 1),
+ 	XGENE_V2_ECAM_MCFG(4, 2),
+=20
++#define N1SDP_ECAM_MCFG(rev, seg, ops) \
++	{"ARMLTD", "ARMN1SDP", rev, seg, MCFG_BUS_ANY, ops }
++
++	/* N1SDP SoC with v1 PCIe controller */
++	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
++	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
++
+ #define ALTRA_ECAM_QUIRK(rev, seg) \
+ 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
+=20
+diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconf=
ig
+index 64e2f5e379aa..df10736b2d9e 100644
+--- a/drivers/pci/controller/Kconfig
++++ b/drivers/pci/controller/Kconfig
+@@ -37,6 +37,17 @@ config PCI_FTPCI100
+ 	depends on OF
+ 	default ARCH_GEMINI
+=20
++config PCIE_HOST_N1SDP_ECAM
++	bool "ARM N1SDP PCIe Controller"
++	depends on ARM64
++	depends on OF || (ACPI && PCI_QUIRKS)
++	select PCI_HOST_COMMON
++	default y if ARCH_VEXPRESS
++	help
++	  Say Y here if you want PCIe support for the Arm N1SDP platform.
++	  The controller is ECAM compliant, but needs a quirk to workaround
++	  an integration issue.
++
+ config PCI_TEGRA
+ 	bool "NVIDIA Tegra PCIe controller"
+ 	depends on ARCH_TEGRA || COMPILE_TEST
+diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Make=
file
+index 04c6edc285c5..6e5c3dcae8d3 100644
+--- a/drivers/pci/controller/Makefile
++++ b/drivers/pci/controller/Makefile
+@@ -29,6 +29,7 @@ obj-$(CONFIG_PCIE_ROCKCHIP_HOST) +=3D pcie-rockchip-host=
.o
+ obj-$(CONFIG_PCIE_MEDIATEK) +=3D pcie-mediatek.o
+ obj-$(CONFIG_PCIE_TANGO_SMP8759) +=3D pcie-tango.o
+ obj-$(CONFIG_VMD) +=3D vmd.o
++obj-$(CONFIG_PCIE_HOST_N1SDP_ECAM) +=3D pcie-n1sdp.o
+ obj-$(CONFIG_PCIE_BRCMSTB) +=3D pcie-brcmstb.o
+ obj-$(CONFIG_PCI_LOONGSON) +=3D pci-loongson.o
+ obj-$(CONFIG_PCIE_HISI_ERR) +=3D pcie-hisi-error.o
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/=
pcie-n1sdp.c
+new file mode 100644
+index 000000000000..327aee9c5564
+--- /dev/null
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -0,0 +1,198 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * Copyright (C) 2018/2019 ARM Ltd.
++ *
++ * This quirk is to mask the following issues:
++ * - PCIE SLVERR: config space accesses to invalid PCIe BDFs cause a bus
++ *		  error (signalled as an asynchronous SError)
++ * - MCFG BDF mapping: the root complex is mapped separately from the dev=
ice
++ *		       config space
++ * - Non 32-bit accesses to config space are not supported.
++ *
++ * At boot time the SCP board firmware creates a discovery table with
++ * the root complex' base address and the valid BDF values, discovered wh=
ile
++ * scanning the config space and catching the SErrors.
++ * Linux responds only to the EPs listed in this table, returning NULL
++ * for the rest.
++ */
++
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/ioport.h>
++#include <linux/sizes.h>
++#include <linux/of_pci.h>
++#include <linux/of.h>
++#include <linux/pci-ecam.h>
++#include <linux/platform_device.h>
++#include <linux/module.h>
++
++/* Platform specific values as hardcoded in the firmware. */
++#define AP_NS_SHARED_MEM_BASE	0x06000000
++#define MAX_SEGMENTS		2
++#define BDF_TABLE_SIZE		SZ_16K
++
++/*
++ * Shared memory layout as written by the SCP upon boot time:
++ *  ----
++ *  Discover data header --> RC base address
++ *                       \-> BDF Count
++ *  Discover data        --> BDF 0...n
++ *  ----
++ */
++struct pcie_discovery_data {
++	u32 rc_base_addr;
++	u32 nr_bdfs;
++	u32 valid_bdfs[0];
++} *pcie_discovery_data[MAX_SEGMENTS];
++
++void __iomem *rc_remapped_addr[MAX_SEGMENTS];
++
++/*
++ * map_bus() is called before we do a config space access for a certain
++ * device. We use this to check whether this device is valid, avoiding
++ * config space accesses which would result in an SError otherwise.
++ */
++static void __iomem *pci_n1sdp_map_bus(struct pci_bus *bus, unsigned int =
devfn,
++				       int where)
++{
++	struct pci_config_window *cfg =3D bus->sysdata;
++	unsigned int devfn_shift =3D cfg->ops->bus_shift - 8;
++	unsigned int busn =3D bus->number;
++	unsigned int segment =3D bus->domain_nr;
++	unsigned int bdf_addr;
++	unsigned int table_count, i;
++
++	if (segment >=3D MAX_SEGMENTS ||
++	    busn < cfg->busr.start || busn > cfg->busr.end)
++		return NULL;
++
++	/* The PCIe root complex has a separate config space mapping. */
++	if (busn =3D=3D 0 && devfn =3D=3D 0)
++		return rc_remapped_addr[segment] + where;
++
++	busn -=3D cfg->busr.start;
++	bdf_addr =3D (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
++	table_count =3D pcie_discovery_data[segment]->nr_bdfs;
++	for (i =3D 0; i < table_count; i++) {
++		if (bdf_addr =3D=3D pcie_discovery_data[segment]->valid_bdfs[i])
++			return pci_ecam_map_bus(bus, devfn, where);
++	}
++
++	return NULL;
++}
++
++static int pci_n1sdp_init(struct pci_config_window *cfg, unsigned int seg=
ment)
++{
++	phys_addr_t table_base;
++	struct device *dev =3D cfg->parent;
++	struct pcie_discovery_data *shared_data;
++	size_t bdfs_size;
++
++	if (segment >=3D MAX_SEGMENTS)
++		return -ENODEV;
++
++	table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++
++	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
++				"PCIe valid BDFs")) {
++		dev_err(dev, "PCIe BDF shared region request failed\n");
++		return -ENOMEM;
++	}
++
++	shared_data =3D devm_ioremap(dev,
++				   table_base, BDF_TABLE_SIZE);
++	if (!shared_data)
++		return -ENOMEM;
++
++	/* Copy the valid BDFs structure to allocated normal memory. */
++	bdfs_size =3D sizeof(struct pcie_discovery_data) +
++		    sizeof(u32) * shared_data->nr_bdfs;
++	pcie_discovery_data[segment] =3D devm_kmalloc(dev, bdfs_size, GFP_KERNEL=
);
++	if (!pcie_discovery_data[segment])
++		return -ENOMEM;
++
++	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
++
++	rc_remapped_addr[segment] =3D devm_ioremap(dev,
++						shared_data->rc_base_addr,
++						PCI_CFG_SPACE_EXP_SIZE);
++	if (!rc_remapped_addr[segment]) {
++		dev_err(dev, "Cannot remap root port base\n");
++		return -ENOMEM;
++	}
++
++	devm_iounmap(dev, shared_data);
++
++	return 0;
++}
++
++static int pci_n1sdp_pcie_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 0);
++}
++
++static int pci_n1sdp_ccix_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 1);
++}
++
++const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops =3D {
++	.bus_shift	=3D 20,
++	.init		=3D pci_n1sdp_pcie_init,
++	.pci_ops	=3D {
++		.map_bus        =3D pci_n1sdp_map_bus,
++		.read           =3D pci_generic_config_read32,
++		.write          =3D pci_generic_config_write32,
++	}
++};
++
++const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops =3D {
++	.bus_shift	=3D 20,
++	.init		=3D pci_n1sdp_ccix_init,
++	.pci_ops	=3D {
++		.map_bus        =3D pci_n1sdp_map_bus,
++		.read           =3D pci_generic_config_read32,
++		.write          =3D pci_generic_config_write32,
++	}
++};
++
++struct of_device_id n1sdp_pcie_of_match[] =3D {
++	{ .compatible =3D "arm,n1sdp-pcie" },
++	{ },
++};
++MODULE_DEVICE_TABLE(of, n1sdp_pcie_of_match);
++
++static int n1sdp_pcie_probe(struct platform_device *pdev)
++{
++	const struct device_node *of_node =3D pdev->dev.of_node;
++	u32 segment;
++
++	if (of_property_read_u32(of_node, "linux,pci-domain", &segment)) {
++		dev_err(&pdev->dev, "N1SDP PCI controllers require linux,pci-domain pro=
perty\n");
++		return -EINVAL;
++	}
++
++	switch (segment) {
++	case 0:
++		n1sdp_pcie_of_match[0].data =3D &pci_n1sdp_pcie_ecam_ops;
++		return pci_host_common_probe(pdev);
++	case 1:
++		n1sdp_pcie_of_match[0].data =3D &pci_n1sdp_ccix_ecam_ops;
++		return pci_host_common_probe(pdev);
++	}
++
++	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n",
++		MAX_SEGMENTS);
++
++	return -EINVAL;
++}
++
++static struct platform_driver n1sdp_pcie_driver =3D {
++	.driver =3D {
++		.name =3D KBUILD_MODNAME,
++		.of_match_table =3D n1sdp_pcie_of_match,
++		.suppress_bind_attrs =3D true,
++	},
++	.probe =3D n1sdp_pcie_probe,
++};
++builtin_platform_driver(n1sdp_pcie_driver);
+diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
+index 033ce74f02e8..d3959ada44af 100644
+--- a/include/linux/pci-ecam.h
++++ b/include/linux/pci-ecam.h
+@@ -58,6 +58,8 @@ extern const struct pci_ecam_ops pci_thunder_ecam_ops; /=
* Cavium ThunderX 1.x */
+ extern const struct pci_ecam_ops xgene_v1_pcie_ecam_ops; /* APM X-Gene PC=
Ie v1 */
+ extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops; /* APM X-Gene PC=
Ie v2.x */
+ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PC=
Ie */
++extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PC=
Ie */
++extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PC=
Ie */
+ #endif
+=20
+ #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-=
n1sdp-update-n1sdp-pci-quirk-for-SR-IOV-support.patch b/meta-arm-bsp/recipe=
s-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-update-n1sdp-pci-quirk-for=
-SR-IOV-support.patch
new file mode 100644
index 0000000..5a53460
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0003-n1sdp-u=
pdate-n1sdp-pci-quirk-for-SR-IOV-support.patch
@@ -0,0 +1,58 @@
+From f3662513b224d9704355afc61a9dc26493bbdf13 Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Tue, 5 Jan 2021 17:57:46 +0000
+Subject: [PATCH 3/4] n1sdp: update n1sdp pci quirk for SR-IOV support
+
+Upstream-Status: Inappropriate [will not be submitted as its an hack requi=
red to fix the hardware issue]
+
+The patch is taken from:
+https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/tree=
/linux
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+VFs are not probing the vendor ID first, which is otherwise
+the gate keeper for undiscovered devices. So any accesses using
+a config space offset greater than 0 must be coming for an
+already discovered device or from a VF that has just been created.
+
+Also if Linux already has a struct pci_dev* for a given BDF,
+this device is safe to access.
+
+Skip the firmware table in these cases and allow accesses to
+those devices. That enables SR-IOV support on the N1SDP board.
+
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+---
+ drivers/pci/controller/pcie-n1sdp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/=
pcie-n1sdp.c
+index 327aee9c5564..45bbe506045a 100644
+--- a/drivers/pci/controller/pcie-n1sdp.c
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -61,6 +61,7 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus *b=
us, unsigned int devfn,
+ 	unsigned int segment =3D bus->domain_nr;
+ 	unsigned int bdf_addr;
+ 	unsigned int table_count, i;
++	struct pci_dev *dev;
+=20
+ 	if (segment >=3D MAX_SEGMENTS ||
+ 	    busn < cfg->busr.start || busn > cfg->busr.end)
+@@ -70,6 +71,14 @@ static void __iomem *pci_n1sdp_map_bus(struct pci_bus *=
bus, unsigned int devfn,
+ 	if (busn =3D=3D 0 && devfn =3D=3D 0)
+ 		return rc_remapped_addr[segment] + where;
+=20
++	dev =3D pci_get_domain_bus_and_slot(segment, busn, devfn);
++	if (dev && dev->is_virtfn)
++		return pci_ecam_map_bus(bus, devfn, where);
++
++	/* Accesses beyond the vendor ID always go to existing devices. */
++	if (where > 0)
++		return pci_ecam_map_bus(bus, devfn, where);
++
+ 	busn -=3D cfg->busr.start;
+ 	bdf_addr =3D (busn << cfg->ops->bus_shift) + (devfn << devfn_shift);
+ 	table_count =3D pcie_discovery_data[segment]->nr_bdfs;
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-=
n1sdp-pcie-add-quirk-support-enabling-remote-chip-PC.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-pcie-add-quirk-suppor=
t-enabling-remote-chip-PC.patch
new file mode 100644
index 0000000..10a59e8
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0004-n1sdp-p=
cie-add-quirk-support-enabling-remote-chip-PC.patch
@@ -0,0 +1,137 @@
+From 604e0130dff007f28a510291064edf20aff3ddea Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Tue, 5 Jan 2021 18:20:16 +0000
+Subject: [PATCH 4/4] n1sdp: pcie: add quirk support enabling remote chip P=
CIe
+
+Upstream-Status: Inappropriate [will not be submitted as its an hack requi=
red to fix the hardware issue]
+
+This patch is picked from the git repository and ported 5.10:
+https://git.linaro.org/landing-teams/working/arm/n1sdp-pcie-quirk.git/patc=
h/?id=3D04b7e76d0fe6481a803f58e54e008a1489d713a5
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+Base address mapping for remote chip Root PCIe ECAM space.
+
+Remote Chip PCIe topology is enumerated in Firmware and current
+change takes referecne of enumerated PCIe hierarchy of Remote chip into th=
e
+kernel and include in complete PCIe topology for kernel framework.
+
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+---
+ drivers/acpi/pci_mcfg.c             |  1 +
+ drivers/pci/controller/pcie-n1sdp.c | 36 ++++++++++++++++++++++++++---
+ include/linux/pci-ecam.h            |  1 +
+ 3 files changed, 35 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/acpi/pci_mcfg.c b/drivers/acpi/pci_mcfg.c
+index f7a7d6e87780..0523f485c930 100644
+--- a/drivers/acpi/pci_mcfg.c
++++ b/drivers/acpi/pci_mcfg.c
+@@ -149,6 +149,7 @@ static struct mcfg_fixup mcfg_quirks[] =3D {
+ 	/* N1SDP SoC with v1 PCIe controller */
+ 	N1SDP_ECAM_MCFG(0x20181101, 0, &pci_n1sdp_pcie_ecam_ops),
+ 	N1SDP_ECAM_MCFG(0x20181101, 1, &pci_n1sdp_ccix_ecam_ops),
++	N1SDP_ECAM_MCFG(0x20181101, 2, &pci_n1sdp_remote_pcie_ecam_ops),
+=20
+ #define ALTRA_ECAM_QUIRK(rev, seg) \
+ 	{ "Ampere", "Altra   ", rev, seg, MCFG_BUS_ANY, &pci_32b_read_ops }
+diff --git a/drivers/pci/controller/pcie-n1sdp.c b/drivers/pci/controller/=
pcie-n1sdp.c
+index 45bbe506045a..01f601e36343 100644
+--- a/drivers/pci/controller/pcie-n1sdp.c
++++ b/drivers/pci/controller/pcie-n1sdp.c
+@@ -28,8 +28,11 @@
+=20
+ /* Platform specific values as hardcoded in the firmware. */
+ #define AP_NS_SHARED_MEM_BASE	0x06000000
+-#define MAX_SEGMENTS		2
++
++/* Two PCIe root complexes in One Chip + One PCIe RC in Remote Chip*/
++#define MAX_SEGMENTS		3
+ #define BDF_TABLE_SIZE		SZ_16K
++#define REMOTE_CHIP_ADDR_OFFSET	0x40000000000
+=20
+ /*
+  * Shared memory layout as written by the SCP upon boot time:
+@@ -100,7 +103,10 @@ static int pci_n1sdp_init(struct pci_config_window *c=
fg, unsigned int segment)
+ 	if (segment >=3D MAX_SEGMENTS)
+ 		return -ENODEV;
+=20
+-	table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
++	if (segment > 1)
++		table_base =3D AP_NS_SHARED_MEM_BASE + REMOTE_CHIP_ADDR_OFFSET;
++	else
++		table_base =3D AP_NS_SHARED_MEM_BASE + segment * BDF_TABLE_SIZE;
+=20
+ 	if (!request_mem_region(table_base, BDF_TABLE_SIZE,
+ 				"PCIe valid BDFs")) {
+@@ -122,9 +128,15 @@ static int pci_n1sdp_init(struct pci_config_window *c=
fg, unsigned int segment)
+=20
+ 	memcpy_fromio(pcie_discovery_data[segment], shared_data, bdfs_size);
+=20
+-	rc_remapped_addr[segment] =3D devm_ioremap(dev,
++	if (segment > 1)
++		rc_remapped_addr[segment] =3D devm_ioremap(dev,
++						shared_data->rc_base_addr + REMOTE_CHIP_ADDR_OFFSET,
++						PCI_CFG_SPACE_EXP_SIZE);
++	else
++		rc_remapped_addr[segment] =3D devm_ioremap(dev,
+ 						shared_data->rc_base_addr,
+ 						PCI_CFG_SPACE_EXP_SIZE);
++
+ 	if (!rc_remapped_addr[segment]) {
+ 		dev_err(dev, "Cannot remap root port base\n");
+ 		return -ENOMEM;
+@@ -145,6 +157,11 @@ static int pci_n1sdp_ccix_init(struct pci_config_wind=
ow *cfg)
+ 	return pci_n1sdp_init(cfg, 1);
+ }
+=20
++static int pci_n1sdp_remote_pcie_init(struct pci_config_window *cfg)
++{
++	return pci_n1sdp_init(cfg, 2);
++}
++
+ const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops =3D {
+ 	.bus_shift	=3D 20,
+ 	.init		=3D pci_n1sdp_pcie_init,
+@@ -165,6 +182,16 @@ const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops =3D=
 {
+ 	}
+ };
+=20
++const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops =3D {
++	.bus_shift	=3D 20,
++	.init		=3D pci_n1sdp_remote_pcie_init,
++	.pci_ops	=3D {
++		.map_bus	=3D pci_n1sdp_map_bus,
++		.read		=3D pci_generic_config_read32,
++		.write		=3D pci_generic_config_write32,
++	}
++};
++
+ struct of_device_id n1sdp_pcie_of_match[] =3D {
+ 	{ .compatible =3D "arm,n1sdp-pcie" },
+ 	{ },
+@@ -188,6 +215,9 @@ static int n1sdp_pcie_probe(struct platform_device *pd=
ev)
+ 	case 1:
+ 		n1sdp_pcie_of_match[0].data =3D &pci_n1sdp_ccix_ecam_ops;
+ 		return pci_host_common_probe(pdev);
++	case 2:
++		n1sdp_pcie_of_match[0].data =3D &pci_n1sdp_remote_pcie_ecam_ops;
++		return pci_host_common_probe(pdev);
+ 	}
+=20
+ 	dev_err(&pdev->dev, "Invalid segment number, must be smaller than %d\n",
+diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
+index d3959ada44af..08d9684b7dc8 100644
+--- a/include/linux/pci-ecam.h
++++ b/include/linux/pci-ecam.h
+@@ -60,6 +60,7 @@ extern const struct pci_ecam_ops xgene_v2_pcie_ecam_ops;=
 /* APM X-Gene PCIe v2.x
+ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PC=
Ie */
+ extern const struct pci_ecam_ops pci_n1sdp_pcie_ecam_ops; /* Arm N1SDP PC=
Ie */
+ extern const struct pci_ecam_ops pci_n1sdp_ccix_ecam_ops; /* Arm N1SDP PC=
Ie */
++extern const struct pci_ecam_ops pci_n1sdp_remote_pcie_ecam_ops; /* Arm N=
1SDP PCIe */
+ #endif
+=20
+ #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-=
r8169-Fix-to-avoid-duplicate-sysfs-entry-creation-er.patch b/meta-arm-bsp/r=
ecipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-Fix-to-avoid-duplicat=
e-sysfs-entry-creation-er.patch
new file mode 100644
index 0000000..143f78b
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/0005-r8169-F=
ix-to-avoid-duplicate-sysfs-entry-creation-er.patch
@@ -0,0 +1,45 @@
+From 914fe7871fc2f00ec94cd4d17722158e94fa88df Mon Sep 17 00:00:00 2001
+From: Khasim Mohammed <khasim.mohammed@arm.com>
+Date: Fri, 8 Jan 2021 04:21:23 +0000
+Subject: [PATCH] r8169: Fix to avoid duplicate sysfs entry creation error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending [yet to submit]
+
+Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>
+
+Patch taken from :
+https://git.linaro.org/landing-teams/working/arm/kernel-release.git/commit=
/?h=3Dn1sdp&id=3D84baaae9e751c058717d9702438429257f077f03
+
+Following error observed with r8169 driver, this patch fix the issue.
+
+[ 27.544136] r8169 0002:07:00.0: enabling device (0000 -> 0003)
+[ 27.559734] sysfs: cannot create duplicate filename '/class/mdio_bus/r816=
9-700'
+=E2=80=A6
+[ 27.684858] libphy: mii_bus r8169-700 failed to register
+[ 27.695602] r8169: probe of 0002:07:00.0 failed with error -22
+
+Change-Id: Id696abbabd794ecef5c551c5c45630963d9502a6
+Signed-off-by: Sayanta Pattanayak <sayanta.pattanayak@arm.com>
+---
+ drivers/net/ethernet/realtek/r8169_main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ether=
net/realtek/r8169_main.c
+index 85d9c3e30c69..6d6b24978fd5 100644
+--- a/drivers/net/ethernet/realtek/r8169_main.c
++++ b/drivers/net/ethernet/realtek/r8169_main.c
+@@ -5088,7 +5088,7 @@ static int r8169_mdio_register(struct rtl8169_privat=
e *tp)
+ 	new_bus->priv =3D tp;
+ 	new_bus->parent =3D &pdev->dev;
+ 	new_bus->irq[0] =3D PHY_IGNORE_INTERRUPT;
+-	snprintf(new_bus->id, MII_BUS_ID_SIZE, "r8169-%x", pci_dev_id(pdev));
++	snprintf(new_bus->id, MII_BUS_ID_SIZE, "r8169-%x-%x", pdev->bus->domain_=
nr, pci_dev_id(pdev));
+=20
+ 	new_bus->read =3D r8169_mdio_read_reg;
+ 	new_bus->write =3D r8169_mdio_write_reg;
+--=20
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enabl=
e-realtek-R8169.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/enable-realtek-R8169.cfg
new file mode 100644
index 0000000..7a57474
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-realt=
ek-R8169.cfg
@@ -0,0 +1,3 @@
+# Enable Realtek Gigabit Ethernet adapter
+CONFIG_REALTEK_PHY=3Dy
+CONFIG_R8169=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enabl=
e-usb_conn_gpio.cfg b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1=
sdp/enable-usb_conn_gpio.cfg
new file mode 100644
index 0000000..128c902
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-yocto-5.10/n1sdp/enable-usb_c=
onn_gpio.cfg
@@ -0,0 +1,2 @@
+# PHY_TEGRA_XUSB sets this to y, but its set as m in defconfig
+CONFIG_USB_CONN_GPIO=3Dy
--=20
2.17.1

