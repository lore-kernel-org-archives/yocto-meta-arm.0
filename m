Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.54])
 by mx.groups.io with SMTP id smtpd.web09.5905.1605607679984178818
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 02:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=l3krMM0A;
 spf=pass (domain: arm.com, ip: 40.107.6.54, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSfUslZwO7NGp7vqPl82vBXuTnSIg48r54vjhvoWbhU=;
 b=l3krMM0ANh59y4PbdvTCUgnPYx3FVdLuT51Pizf3d+WbrsWpU8YdpA0ZV8eYxqR2+DX9DFR/D4+afMvQQ2LLbygvDaEHlRNK83vgl0s4HikInVaB+T59Z0BeoXXsDjLqqsvOjPwj69HyFFleEET9obkLf2a8CRzzOIwoFuGpc9w=
Received: from DB6PR0501CA0027.eurprd05.prod.outlook.com (2603:10a6:4:67::13)
 by PA4PR08MB6029.eurprd08.prod.outlook.com (2603:10a6:102:e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 10:07:57 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::ec) by DB6PR0501CA0027.outlook.office365.com
 (2603:10a6:4:67::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Tue, 17 Nov 2020 10:07:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 10:07:57 +0000
Received: ("Tessian outbound 797fb8e1da56:v71"); Tue, 17 Nov 2020 10:07:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 52b62f7c70c2bc85
X-CR-MTA-TID: 64aa7808
Received: from 987aaf1707a6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 061CFBFC-3A5C-4471-8CA5-140B072B54B9.1;
	Tue, 17 Nov 2020 10:07:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 987aaf1707a6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Nov 2020 10:07:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htra/cznN8UU+oH+NoX294eJZaXqm6vXrMCyZCuCzV1/UWsrhHdK9wYSsJsFhgniHWlnaygT+jrCYGv4+yD9eMtXnRgRtf161i8Fw1oXZ+Xi5j6GRAYwdA6HL1JM2qj250x1tDzRWEKjgE4tpEDKfKjz4idHh7X4Jygvyxy2quwun5VR1NnqS5ZivNT9KgTxvI3ejSocTh6Pr7j/mAXurThgcxTuOeegFYTT5Mi7UtezTsiIWLIUIfwjP9Kdh1vsiPIyE4fqI1hx8ROvyruhTzJO5LJe3SLbfd7gdtvcD57BLEf6OBH/+62M+apzmuHo+sJXQFP8hYouNKeFJChIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSfUslZwO7NGp7vqPl82vBXuTnSIg48r54vjhvoWbhU=;
 b=Ld9okFrdGtzKYiRu7QIpFEubExhMs11xf3ZgVGrJ7zzTfGvNK5Q9M/SGmSJV5Qv27hDD8gEEWRpEpw68Vy1HJNhiIOFl0kjd3+VKWto1VFa8S0sIXP8+MwSjgLXw0PJPE5WmZi5drIO/byLlBvy2sATDW/kYhuTCDXOKQ1GqOqI4DP2dxSyermzHmiRPyntFH5O6O0XORvCNPkWRNm0xDrczEg7ngiVCdGWwObfvzKZHg8v2FvkvEUOqn6pEB8C30rAZv6t/k5/i5FGmwU9yzPFWAUZzcduGOlOEi/B1MuneJNmUgTPdG4UfcOtF83KxHG3A5Pz2YdbrjhCUySjAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSfUslZwO7NGp7vqPl82vBXuTnSIg48r54vjhvoWbhU=;
 b=l3krMM0ANh59y4PbdvTCUgnPYx3FVdLuT51Pizf3d+WbrsWpU8YdpA0ZV8eYxqR2+DX9DFR/D4+afMvQQ2LLbygvDaEHlRNK83vgl0s4HikInVaB+T59Z0BeoXXsDjLqqsvOjPwj69HyFFleEET9obkLf2a8CRzzOIwoFuGpc9w=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB2998.eurprd08.prod.outlook.com (2603:10a6:209:4e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 17 Nov
 2020 10:07:49 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::cdcd:fe5b:60c:2a9f%6]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 10:07:49 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 4/8] arm-autonomy/arm-autonomy-host-image-minimal: Build/Install alternate kernel
Date: Tue, 17 Nov 2020 10:04:45 +0000
Message-Id: <20201117100449.20111-5-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117100449.20111-1-diego.sueiro@arm.com>
References: <20201117100449.20111-1-diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28 via Frontend Transport; Tue, 17 Nov 2020 10:07:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1bcce82e-ebb2-47a3-1302-08d88ae0a867
X-MS-TrafficTypeDiagnostic: AM6PR08MB2998:|PA4PR08MB6029:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB602944C35A4BCF7D547733C992E20@PA4PR08MB6029.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EG4QfR+gxnt1xdHWXha1oodxdT+UCLNSjba8SHMkCAnpwoqPov3YUC1uXCI1+7guxd2czR95T2W6oILZgJXIokxpSeA1Md2UI2LsuGI39w4QSHG0HW0c7suu4NyZi9/xNpSgPa8neRbld1Bs97nctzmzMgjqnNcP++0KmyQkR9GDvT4oqGcmm3lmE10RqdCWdEndG10xhgxyOhV8m24Y08PvkuHFZTMCzDFgKdPT4vZgbs/PBJdqm0Y4lYpqwd/dJotjFctzJDDPIooubzUwPZaMHxwFBMrJwWKSbFCMULO3BgUI8+0UihWW4XARREpp
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(66556008)(5660300002)(86362001)(66476007)(66946007)(6486002)(316002)(6916009)(44832011)(36756003)(16526019)(8676002)(8936002)(2906002)(186003)(6666004)(1076003)(956004)(2616005)(26005)(52116002)(7696005)(478600001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 K78Ua3LrlSskDdfzS7YvGBABaEL0ypPnzvD/EA1AevFJoOsmgKzoZ2rPGY+nWf/IA6vKJe/DXH7YV4p9SsD7Q0la/mOXJSkdHnR39cMxU6iQR3nsv0/jz8EAc53U6lQuvBc7VFsoYjzPlJWzykNl69sAxp9TKyPaX24o8nCMfjEsb8S2zUfppdVkOLwFsOSbtWr1pIHXDna1Q8dN56cQGP3XsXcFcu1vgP82FAHfa8ZeFyO7z0UTliCFbS8Zha3fwPU/lNyD8s+3sJco5iBFEb0TDi/xCndoVcj6hQBsQ1W4u4bu2SeA8IyCUbxar/ccMlkqgy07DL+QEMEBbDeNQr7ZptYO9kKfbVBN9b7szCdrteDI8WcgDAUJVXVxTWy1nWkU6BGacSUe0ykxvjzBicAqhyaj0AadaYzle8SQvh0swftYZjx45MkiGzmvnBc3rmDHwFIxQJ58lPWEhYEPw7UlD5wbs28O3s20cRqY/UlOmQ/jYgqRTksTCPPMiqbuw7xz15WOtunMq2mmP8b/chJgFzQAR9F6dJkyvB65ikyYDcQRU+5jK24UaebJtnPynZwfo0M/HXfhBPPfhjbc+CmUA6h1ugYDTg3W0gKGE8wg6hJXrT4MBCmJ+650pHVWV/cUjNHTa2N8WCPyYV9FPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2998
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d86a00ec-e966-4755-352a-08d88ae0a34e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XghQ81ZJ+u0no+GTlRbk/6r97YZEpnsLdMiAeb/Y7blNKw0n/2sVTX2EoW1sMA+E8J+JvxtiZiYfQkmtXrMDwloVAv4oc/Fu1SwIqLJj1tjE0e63O6iHwvqf9wB01PL4F0AVDwKVZX85F0JoiEetPCmshxX060ckysx/BU71pSlUA33IU5ReVsRjbAdRvoXOuNwuyGjAcOVYmKXNYBhpxXmsdYlE0tb7fGybIUMWwWd/8KziuBUv1aey0FPP1E42WPcMZPLh4LqYTvLOjAeNrze/JqpptGmMaMD0lC+AFz+Uhqzzlq54LE37X+xZiQI25Sogllsjnt/BinN3tkGnxZSdw0GPEydwDnY10w5wMM5GDxO7JAlxJIlhiQqDtv54UfXx7UtaW17RnVbzz1a9WQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966005)(16526019)(70206006)(36756003)(336012)(186003)(47076004)(86362001)(7696005)(70586007)(316002)(82740400003)(2616005)(956004)(44832011)(6486002)(478600001)(8936002)(26005)(6916009)(6666004)(1076003)(4326008)(81166007)(356005)(5660300002)(8676002)(82310400003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 10:07:57.5489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcce82e-ebb2-47a3-1302-08d88ae0a867
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6029
Content-Type: text/plain

This patch introduces the usage of the alternate-kernel DISTRO_FEATURE, and
when it is present we will build and install the alternate kernel set via
PREFERRED_PROVIDER_alternate/kernel.

Change-Id: I1fe7447a5f903d7ff5584813bfb38fca8979e755
Issue-Id: SCM-1654
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-core/images/arm-autonomy-host-image-minimal.bb    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 47a07cd..0a90abb 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -2,6 +2,10 @@
 
 DESCRIPTION = "Arm Autonomy stack host minimal image"
 
+# When alternate-kernel DISTRO_FEATURE is present we will build
+# and install the alternate kernel
+inherit ${@bb.utils.filter('DISTRO_FEATURES', 'alternate-kernel', d)}
+
 inherit core-image
 
 LICENSE = "MIT"
-- 
2.17.1

