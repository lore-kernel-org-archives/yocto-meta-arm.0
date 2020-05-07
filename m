Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web10.3821.1588849728794639105
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 May 2020 04:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oJMQ+Rfn;
 spf=pass (domain: arm.com, ip: 40.107.22.64, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOaNiQlLIN4l1oHFTdGOh1kiC+Ahs+gC6YG3DLhQr+4=;
 b=oJMQ+Rfnyb4W9E+w0zqPE7dOMQ7zTLGip7wy8HUoNMgl3hIk+95Hmqd581MixR8Qv7ItdRWEFHk/UDSdQ1i/BTFpZuUSJ/Y2mD/L0YAmv/nd1GsyOWSypGUtspkPK4OK15bUYJj7htIKQi1na2dc9Tymn4xClCLWm1ProSWv664=
Received: from AM6PR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::44) by VI1PR0801MB1869.eurprd08.prod.outlook.com
 (2603:10a6:800:88::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 7 May
 2020 11:08:46 +0000
Received: from AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::14) by AM6PR01CA0067.outlook.office365.com
 (2603:10a6:20b:e0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Thu, 7 May 2020 11:08:46 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT059.mail.protection.outlook.com (10.152.17.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Thu, 7 May 2020 11:08:46 +0000
Received: ("Tessian outbound e88319d7ccd0:v54"); Thu, 07 May 2020 11:08:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 973a58c8a5f658fd
X-CR-MTA-TID: 64aa7808
Received: from ccc8f1331c5c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4B7AB5DD-F156-4172-AEB8-8AD4E46EFFA3.1;
	Thu, 07 May 2020 11:08:40 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ccc8f1331c5c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 May 2020 11:08:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TO+C6q+wPjgw9oRjY80wyDE8/DfxQD7+0+BW0fd/kNw29A93ThDfsgfgib1iuOGGfVrPs0F5/lsIbu8YdybFhrJge1iMGIC+qWBphQf3ZpJoiMClehg/JYE6zlw/XFE5VghhmGVEShHDviy2Kc78Iof9GuVok/bvzhmYBRrjspVwpWVJ/SuEscHH6QyVNSqIUV//E8G74xW9mHyLcxcRn4sXf8JgPeE0JScA7sLY7Kte+SChY+XlrvVKE2Mo5PjtTzN0QxWNR/fxmIH4ttAOPMwh6BF4jN9HpG0kQxryTnjmXSaVOwXIpHPIRAE/WHI8qi+lxnutv1+OsB0VplTryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOaNiQlLIN4l1oHFTdGOh1kiC+Ahs+gC6YG3DLhQr+4=;
 b=g+IANZNWnez2yp5Vo1KT6UggdYqx7gmsVY+4nRAI1okbSmxMDMNWNP2kUwSkkalvxFWqc4Xp3MroQkK5n/Y/qT6n567rarDeL0C+64/rOA6CDNRPJdCULXv3JllCb9VNxQj3NTgK3/o9th9J0Bo661X0CSgjWRhpvHXogQCGaLsRnYN2xV8/W3KL1terQSPC8xAH41y0p29ZODnaP+xWLTqck1NMsC+qQmOj+gFOjrSztrbic8XtdQmz6LLURvjRYehfhC1T6JviTfOzr/jWsTt6tXJmww1sypwedVhmuENrmUuaw5jvuZgQPYshqoGv4BwxnPIvHYFUdMm0HAUR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOaNiQlLIN4l1oHFTdGOh1kiC+Ahs+gC6YG3DLhQr+4=;
 b=oJMQ+Rfnyb4W9E+w0zqPE7dOMQ7zTLGip7wy8HUoNMgl3hIk+95Hmqd581MixR8Qv7ItdRWEFHk/UDSdQ1i/BTFpZuUSJ/Y2mD/L0YAmv/nd1GsyOWSypGUtspkPK4OK15bUYJj7htIKQi1na2dc9Tymn4xClCLWm1ProSWv664=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB2954.eurprd08.prod.outlook.com (2603:10a6:5:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 11:08:39 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Thu, 7 May 2020
 11:08:39 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/4] [arm-autonomy] qemu: Don't build with audio support when Xen is present
Date: Thu,  7 May 2020 12:08:24 +0100
Message-Id: <20200507110825.38541-4-bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507110825.38541-1-bertrand.marquis@arm.com>
References: <20200507110825.38541-1-bertrand.marquis@arm.com>
X-ClientProxiedBy: LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::32) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.50) by LNXP123CA0020.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 11:08:38 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.50]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 509be2a3-8dff-4ae9-7929-08d7f27702f2
X-MS-TrafficTypeDiagnostic: DB7PR08MB2954:|VI1PR0801MB1869:
X-Microsoft-Antispam-PRVS: 
	<VI1PR0801MB1869ED85FF461F393380FC4B9DA50@VI1PR0801MB1869.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tN8ofXA8++nV5Rny+7Jl1oyhl9iCRraWJx0+riN8TVOwGXcfZK42QSM8e27iXM5K4SSM3UZ+fllSOOhQwTz0Ysi61LaFhEi2jU9Cp9JmnhGntd2REQ68HRZsJmkak20rZ5cbWfm5//w+viySMcTbWxsjSWh+95tmXWcj/4I1RImZEsMNvVIwSH4/lQi4iX2qmbTyPganNGOyBKxvsDtDUg+WwROj8Y2+Aq6XXLgZd3uqEB2SdIi+MbRL/uFcefNnDtz9U3groNxlKoq3xfO0JaJiZD+Z0cTsnP8Gdr2cZScg/PxtIBjg1aEaOXtdNc7cAksQlAe8tJih4tB1G8vTFZmR6pg7GIjxaJbrdRgkGs7s//Kdz2WejVTcCxWsSuRFUwjD7bAIB+hVTPLpBIkKHM9+zuIaugY5E8LUuVUqGEv/+g0f5I13CrHLHPcFriA9vZ3ACK6A5dGLn13jUkgqQedsijB9gigl15b9k5F2S1Y/e8i3RGAZMur5uABsnbNyv8oyOlqBb4Gmx9evegD2CQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(33430700001)(1076003)(16526019)(316002)(2616005)(8936002)(5660300002)(33440700001)(44832011)(66946007)(4326008)(66476007)(2906002)(186003)(956004)(52116002)(86362001)(83280400001)(83320400001)(83290400001)(26005)(36756003)(478600001)(83310400001)(6666004)(83300400001)(7696005)(8676002)(6486002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 qsDO75kkvL5BEkGrfPEQei18DjdKHXWEaMYMmuMW11lmYlF8wfnaBt80q2gHlq2dpBTUFRb2N5l9kVktTarxJRi8ci3qzHtLuZj1QddlIylZlbCJ5jqfXn9Pl2vxhVGHIYo0BckzbMv8HG3GoJEkTH/JDDUwoc6vOyavz1CYvBZpJFzzDG7o4hx7LMMbggUOufhKdoDMFhpvGPaRRfPH5FKechjSbw9n1ZBgaavzbar2fU1rokqjBDx897GfDZ6FfC/OMMpyTBQrI29pKwYx6SCU9YWW3GFZz0HNnivtWWhuam88Josx6Lc3BoU8utkF2MhHXzbfQ7R5EIPUxVjtm+VNYpear03awlwxk+odgOSoZoMmHJlw49hLdkD8ozTUSow8vrtkGw1+H9vBXcAWG92CgkoGScOvoEItolfn1q6/xo98lzAUX5bszg4HxuQMHyRJtJTpYv6YFPT/iyfv7tf8DhwXK659ciNfzzjrnqq878CmMHVjjtdplo2TmxD5Kr1gwziakcsm7w7YVNzdI3STlumEF3nANF8w6RpK48mNe1h352jCCxKBu68RkL15aUh8e51iXO63tK5DM4iRTBuZY2HfbnlH7D90kmzERKjo2zG/yK35+QCG9Ozk5C9V7ZuEjlWUD0NYEe6Fk9x31KE2pAgnB3TOmCP5vB8n72r+XQ5HKha9rCosdbgU+4Vfd8iju4rcC2deIQMFr1H6tUSkFch+96F4nLNwIX4LZ2iHpENBtIcHpKhtaojh0P3PFLR4V6BbC8cxICJTousQhN2AM16X1q9ADGSOOMW1b5k=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2954
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966005)(33430700001)(26005)(82740400003)(7696005)(70206006)(86362001)(36906005)(81166007)(5660300002)(8676002)(70586007)(1076003)(6666004)(4326008)(6916009)(478600001)(6486002)(44832011)(8936002)(16526019)(186003)(956004)(47076004)(316002)(2616005)(336012)(33440700001)(2906002)(356005)(82310400002)(36756003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4d51e0aa-08d8-4879-23d7-08d7f276fe70
X-Forefront-PRVS: 03965EFC76
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Va51YC/ANP/idPREDE2uRTDfBIv9QVYVP6+qGBCPgmE7GPF6X5NGVVOMoqmLjKjBcA89MLqnkDtiOdzTPpKi3Cu5zach7tlW+1mfE+oshvYUwJlV3a6fvU7OkZHxCKhDOLiCqVmCDUzP2JIiH6X6fuV6T/GnDY6d1Y/QBZsMQPk7spHBQd5rQ7y30WAfmV5fwmLIK8wOVCbelaPS2GNwTbzqvl/EpPuVM8wf6LAkcxJHTL9VFdZWDeb+iUfkn737CD+P6JTQExOkYe6O9AERx9JbifL3dzQ8R2XU+mEdW4dGuma3mHtSMJP0Y6JB7YBY8GiRBbb2PuGceu0I93lzRx7KtQFqgGhzQUgM4sF9MUz997UJoYd/iianGtfrh/szD/h0KsO4O1Zydl8iN4V71S03wWK5M3w0GwPEciklSwDymmKW+YquiTD1yJGawjlWV+eTuqvuCeE9Sd1SdopEVZedWrrrGG6Kfl74hC74xMhquhWMl/GMAWxZUR/QW1qByY4Y2m70xLg6qGVi7hY9vkCJWx4Vy8VzIVAe2GCy5SKc6ZxVMUH1oPw2pqi/fVZYnNSCB9nA0EZ3qZUwkTB+HQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 11:08:46.0020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 509be2a3-8dff-4ae9-7929-08d7f27702f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1869
Content-Type: text/plain

From: Diego Sueiro <diego.sueiro@arm.com>

When xen is in DISTRO_FEATURES no audio support is needed. This will
helps reducing the final image size.

Change-Id: I50d83cfe007c3f30a8303dcad66abb188559713c
Issue-Id: SCM-813
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
index b80c293..ed63a4e 100644
--- a/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
+++ b/meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappend
@@ -4,7 +4,9 @@ OVERRIDES_append = "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ':xen', '', d
 
 # For Xen we only need the i386 binaries
 QEMU_TARGETS_xen = "i386"
-PACKAGECONFIG_append_xen = " virtfs"
+
+PACKAGECONFIG[noaudio] = "--audio-drv-list='',,"
+PACKAGECONFIG_append_xen = " virtfs noaudio"
 PACKAGECONFIG_remove_xen = "sdl"
 
 # Reduce the qemu package size by splitting it into
-- 
2.17.1

