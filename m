Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.89])
 by mx.groups.io with SMTP id smtpd.web11.756.1631811844170650702
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Sep 2021 10:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=FByIvrS1;
 spf=pass (domain: arm.com, ip: 40.107.5.89, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nokq/rzo/dX4t2JrKNkbeiBh7fWa+Ro9eRT4gUhpU9Y=;
 b=FByIvrS1w9mz+Rr/cVAitUVOyU2pX2NEScIwZNNCwkkN2Q30TzhrAoBHbhaTPKsjkH5tmJAbw3wLmiRCV8kjPe738E9c/nCRLqpW4Usv9JiFIkSkO0/G1MsBekhsoyc9e6Jv14++IMJClytcOEqf2kiRUBm7p0eCeDWY0LzQGZY=
Received: from AS8P251CA0005.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::10)
 by AM6PR08MB4819.eurprd08.prod.outlook.com (2603:10a6:20b:c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 16 Sep
 2021 17:04:01 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::a2) by AS8P251CA0005.outlook.office365.com
 (2603:10a6:20b:2f2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 17:04:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 17:04:01 +0000
Received: ("Tessian outbound f1898412aff1:v103"); Thu, 16 Sep 2021 17:04:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 44b3f2dbc8ea97cd
X-CR-MTA-TID: 64aa7808
Received: from 5c833b6744bd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B27E20B1-B88A-4E90-B62A-4BBCF6FFFF53.1;
	Thu, 16 Sep 2021 17:03:54 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5c833b6744bd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Sep 2021 17:03:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUU2AbwurSYizKREXQj5SvUXAwPQqrf/u4ghERPT9bUa1AqgJ2nI812Bqj7gB8vCrww/wmaR8n365pglC44l/hhoXnLaF1WQ2mCWWHnjlVlQONGTeF2nSxCVEo+HrGCFIFvIvRcrBzgeSsRVmT85iAT3GhyOer7U7IjKl0EaFgY4mtXpByVgeVpEPDmeTOyaJ5zOQ2rIZZo41jjmO6Tf9sOVRf50xf9vG5H5arVFqGz6DZTjOtnfprJ8MqnGJG+jlNoamZB6CDYl71fSYuWhdN+JmfkGd0GoDKZMaF9SacE5ulXjwc3aSQzPypx42wAVKkbV9npjUWVnL2rhnnCvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nokq/rzo/dX4t2JrKNkbeiBh7fWa+Ro9eRT4gUhpU9Y=;
 b=JUbls2yvFibqijVzKhT+Vq3bM3qHISVoYhUWnzuU8KmR0s3kQLr51o7+DR0kcEPnUo1nRizn6y7e9OtAil1C9JK6VhbH8JStNgyq9NINW/5XxMCbn/yjta8PKDcAH5LUkuaF8o0sx+JwEmIKhlXWULAZjfwPlj5EPBzMjrH9I1nvaGQ7M95HdEfPBHjXaMvrTsBCO01T41BvhAUXX2Scu1glIAr2Fzd63CM9DsIehtC7sLiPNH1sLnEtO3/YH6wvxDnNbAucyku5AKoYPZ71aR/Mw5xZWvc16t//OKqzE6Lvc6poGTlQfj+UXjKh31wZswTkdpMKYH5Ak2QOskIO6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nokq/rzo/dX4t2JrKNkbeiBh7fWa+Ro9eRT4gUhpU9Y=;
 b=FByIvrS1w9mz+Rr/cVAitUVOyU2pX2NEScIwZNNCwkkN2Q30TzhrAoBHbhaTPKsjkH5tmJAbw3wLmiRCV8kjPe738E9c/nCRLqpW4Usv9JiFIkSkO0/G1MsBekhsoyc9e6Jv14++IMJClytcOEqf2kiRUBm7p0eCeDWY0LzQGZY=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBAPR08MB5847.eurprd08.prod.outlook.com (2603:10a6:10:1a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 16 Sep
 2021 17:03:52 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d36:69bc:4803:eee3]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::d36:69bc:4803:eee3%7]) with mapi id 15.20.4500.019; Thu, 16 Sep 2021
 17:03:47 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/3] arm-autonomy/n1sdp: Fix xen build after tunes files update
Date: Thu, 16 Sep 2021 19:02:12 +0200
Message-Id: <20210916170212.26705-3-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210916170212.26705-1-kamil.dziezyk@arm.com>
References: <20210916170212.26705-1-kamil.dziezyk@arm.com>
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ae::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 17:03:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c131c592-4d55-4521-b0c5-08d97933fb02
X-MS-TrafficTypeDiagnostic: DBAPR08MB5847:|AM6PR08MB4819:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4819001FF365EA9361E0920AFDDC9@AM6PR08MB4819.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:525;OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 t+9Aa6XLPtqwaPU+FG8RSG4j5shlqF5MHJoo8hZxtMVf6aZ6MOZPtQMsqc086H5HIgF8tKdRZ+KNZC1yAELt8HeGQRaoYopoxDVZaJ+LsbUPWdiFuNolHDhlNPxNipwBZPWDhHjMHnsBFnpPITREPXsEhSp3bv8AWlQst2rAGghk9TY9oNdWZvG06553DQ/3keR57TCyxBK9PsjCE6T2Cz5THafQptcGcWb4jCYIoXy7IG/rP4IGT0DLbvBuVsj7hD0MoHTDYtw1jAXDSQIImcWfkcNr5rLJSGg3MSSWRssgRCjoybqV4gAeLuvVplDJAtxbS2+HwImBoHJK3yEBSR9td6D9Ml/Xkf6LJgm3CsoROEUBrvH8WogC41xFp73P27hozjsNTmhi3qihMp059S6mw61YKBzAxBjkcVAw4/4cl0hOy7pM9ItV887ju+FnKc6HtrKaTCfEo448gYUr/z9r4p8SliT3C2j0+3pb3fMe02gXvk39DUdnQ8MOJEPa2fQJHSqhApDLS3zSvhUqiF4kN2K97r+54pPbuCzG6tyzLwkqKGfgcCzLSi+BXpWachAOJAGYysWCk8pfBNgcN+1BYFIRQqxA5Dj/rOWet6q9UrQJKggbxCKz4jm0S2nxCCLUfg6cQW1DA0aN6NqnKvDzaoXxVWyOFEKp5IpKGcT7E0Li3qmlGdJjM9ziFFfMhLqGNzFYCZ2oEwMFg257RXCmO8sMLiA1f5qyNew8T0DBhH+OQcWBukiFpIgyP663
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(6916009)(44832011)(38100700002)(956004)(1076003)(38350700002)(2906002)(7696005)(36756003)(26005)(6486002)(4326008)(8936002)(316002)(86362001)(5660300002)(8676002)(66556008)(2616005)(66946007)(66476007)(478600001)(83380400001)(186003)(15650500001)(6666004)(52116002)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5847
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	73460218-82fb-4b87-1f6e-08d97933f269
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j3Sai7gg8cj2AmyVDrUiusDpFh8ZUeio0B0Vzf8tSH2bfhTTnd0rKGPsSyPJA+vnAA+XXJgq9h+VmfJRpz8RGu/+Csht9vp6sb2/wPQNZq/cealVCy0p1CwZeeztGrLrXpFmkOIvjjpbcCn1SjMH78DjPJ7xkIFN+y1Z60fr3Cbzs3v/6UP9XNBSqoyyJh3PmPA2yGzAPebxVL1C77wTRFmhSFtNLulTlHQcE3JIJ6XQTlXsqmyD3tMQ1vU3nQt2i9fSvg7cbmIIBkroEcTramKaIfXFmY5DeuTPgGZjrnTRyRGLO8cevhNlK2Dmad9MFyMNtvsSHlGKL2NzlCDeFkugiDW6Zbp5+SbZXVujFuuPYEVmR0RP7WWpUr6U3jhdynWBHJkIE/OL+g5a545Q36VFXbUAR+/C6ntmH/dkJlRbcZoeoFJrw8zfdrTBmC+vNuK4bscVllDS7YESIsY7HlTXNISNYRhE0/0Cxjkiv1QKuGZbDRixjq7DUUaFE7wpkH8olk1SvVV0FCYHWAxgndCbqfelatVanneBKj0YEnmcOh3Op6zaBNP/BAe2AUHjSi6kL/+yUsRx72h04bcMN5ciqkeK0JJQGev34lKPCmoenRTDcOnbXfhPOL27XT8DkNaaXgJeo1ahvPWW0JX6pWA7MOF9gCcF+6NkHdMQ1qSw+U7YrdiwbTKGWYdRtK8Ddol0QafKfCHeuXGiUbH6tWJZsFmS4tJxcBPs7KD4AqsaQYavAMYfgaoHHCSptTbG
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(1076003)(356005)(6916009)(81166007)(8936002)(508600001)(26005)(186003)(44832011)(36860700001)(4326008)(8676002)(316002)(336012)(956004)(47076005)(15650500001)(82310400003)(70206006)(70586007)(36756003)(2906002)(6486002)(7696005)(5660300002)(86362001)(83380400001)(6666004)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 17:04:01.0566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c131c592-4d55-4521-b0c5-08d97933fb02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4819
Content-Type: text/plain

After update f9cd6797d2925496280fd51cf512cab13da63dbf xen build ends with:
| cc1: error: switch '-mcpu=generic' conflicts with '-march=armv8.2-a+crypto' switch [-Werror]
| cc1: all warnings being treated as errors

This patch removes '-march=*' build flag for xen build.

Issue-Id: SCM-2987
Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: I526c412a0174cdf715b87fcac077b314bf368b8a
---
 .../meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
index 394d1b8..c2916b8 100644
--- a/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
+++ b/meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc
@@ -88,3 +88,7 @@ d.getVar('PREFERRED_PROVIDER_alternate/kernel') else ''}"
 # Additionnal kernel modules are necessary for n1sdp to be able to mount FAT
 # filesystems using CP437.
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS:append = " kernel-module-nls-cp437 kernel-module-nls-iso8859-1"
+
+# '-mcpu=' and '-march=' conflicts for xen build
+# lets not set '-march=' and let xen to overwrite '-mcpu='
+TUNE_CCARGS:remove:pn-xen = "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS}"
-- 
2.17.1

