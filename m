Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1A7C433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 10:17:33 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.75])
 by mx.groups.io with SMTP id smtpd.web10.7927.1652177851020595762
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 May 2022 03:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=XbMuZyfO;
 spf=pass (domain: arm.com, ip: 40.107.1.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EKfOdShNTosiiJdrY81W/Vugh0V/k+feij3Lu71czW3BhR+aKlrWNrzDVLLAIqP/B5vM/rfJmjBpjryiVwTvHOaQ0JNdZU++gIFf8R6Gy7FBTl3s1RfZIaDGlQ141mX37xEdxLcuzEaVEw8W7YfgbO77eZuKN1UzadRHbhz2CqBNBdAEytAl6HOqifh+3k6I7XUf71e2MbgrhcaUGrHWYRb6EHkr1tVx9kJw5o2AHxOcAMO5hiVGsJkyvYSiMeIVSz9UEZ7ItlizSioiegE8B9C8rZdJEpJTiUCr+QLx2BC5KR8PZ+so24cppojSXMIUz6tYsQzHeIbeGpSvXgeoEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+KondSnsFEGr42qzsJ3tfpoX2XkNnwa0nYY1w4o1tM=;
 b=JbK6mJ/IN6CUI2E23/6+fTX+yw/uvMkNGgY5sDBZPyt3zGIfIhb22ry2hcqgnTkBA9kDyvtlDF00WhWwQRm4qWOlH7Impg/n3hn05teHf/I1t/YiqTiKRSK8ibw7IIkcj1SCPMgMwLjmIMMKgBdP4TiKZiME/U6r2xPR+qxby2ugKROJUTt8YXmV7EKEMaVXNcYruUT0HNfU7dE3blUz/mCKC4yZOrdgL6JQSHnh8R0ldS3x6A5mjvx4OvK3AOd2pgu0PEcbPuczE1YTKywnWfsWXFr+KCgssWwAD/SR1lXQjBJh5zV0NFWLZZb69OQKmqETqmY+l4qiUNfCb525wg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+KondSnsFEGr42qzsJ3tfpoX2XkNnwa0nYY1w4o1tM=;
 b=XbMuZyfOvSDzGcgrbNTLJbw89HcN23VXkCzW91hDjrcCm5UIoy8bPmwc26k+muDMqip3UBnnWizMpS8Iw2ivPtbMP2mdrZ9uNLc2S/p2xVws4hnoxD7/h4gAgHIFz9yK6Ydj01hb8UtFoKPrC5CKIDT1dX11PHpqsVgwjal+Iuk=
Received: from DU2PR04CA0268.eurprd04.prod.outlook.com (2603:10a6:10:28e::33)
 by VI1PR08MB3264.eurprd08.prod.outlook.com (2603:10a6:803:4b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 10:17:25 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::a0) by DU2PR04CA0268.outlook.office365.com
 (2603:10a6:10:28e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Tue, 10 May 2022 10:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 10:17:24 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Tue, 10 May 2022 10:17:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9c9a968a6282d60
X-CR-MTA-TID: 64aa7808
Received: from 54b1727d577d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF27205B-93EA-4ED4-BB99-D256D10E13FA.1;
	Tue, 10 May 2022 10:17:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 54b1727d577d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 May 2022 10:17:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgBLwwl6d8iBdT1bAI+y9JtvyZNL6kkGg0wvbLiJnXSF12EBd36W+n1CTyaF8MttsFCuoFITiyYlCbZ8wGtZC/mhkgVaI4WDeVEgIa0zjaR0vLhRFTTvaFQSJbcNJio16DN+vTYPJJDIMgA7AQ/8Kt/RXEIbgHTPt4cdQOLlRj1R2Vj/OQg6a+2YvvBwKKlrwBXvvVsj2dWrKMyoL++jMSOaTzXSaEdeGm0oAEOLWChfQjU8mYRbeI/9EoHPj418UFJdgArCgPYwGW1dYbAH4pnyGSp0sVjMqJHHUDkdrhQdIdfvO7RD00vvq4ARzvXuWRZncruHSIb7sGD/YvkmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+KondSnsFEGr42qzsJ3tfpoX2XkNnwa0nYY1w4o1tM=;
 b=SejQfNroOykfAef+MsZJK/dxoQR2tZtFfJkg+GeUYfydr+Thzaw3JEVttjawuq5tR9YxKeKfqnddvzrwuW08d+6/hHrMBynl1gacLug743I4eeKUQS2zjYVkH/8iCbnDNvt6JmKjfah8zK8p76gXR4ABhmDy21Cm7pVXIz4LlNvc6OvGiKkCPFposBySxGBKH0leia74dtkOnsq4no7nK9Q5r2AcRiVx6NEyWV+YcECS+72Sozd5JcIZeUjNsRindNJmZNRDpE+Ol+DHk5QKkBiYakhkw9vJZA9dq1lLp4DW4JzpvqNhw98JgH3mXNUsrO9hVvKp7/Lq+ORygy2rsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+KondSnsFEGr42qzsJ3tfpoX2XkNnwa0nYY1w4o1tM=;
 b=XbMuZyfOvSDzGcgrbNTLJbw89HcN23VXkCzW91hDjrcCm5UIoy8bPmwc26k+muDMqip3UBnnWizMpS8Iw2ivPtbMP2mdrZ9uNLc2S/p2xVws4hnoxD7/h4gAgHIFz9yK6Ydj01hb8UtFoKPrC5CKIDT1dX11PHpqsVgwjal+Iuk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB7PR08MB2970.eurprd08.prod.outlook.com (2603:10a6:5:17::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 10:17:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%7]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 10:17:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH] CI: use kirkstone branches for meta-clang and
 meta-virtualization
Thread-Topic: [meta-arm] [PATCH] CI: use kirkstone branches for meta-clang and
 meta-virtualization
Thread-Index: AQHYZFbs88Bz1ErApkmFm8154M3xq60X5WKN
Date: Tue, 10 May 2022 10:17:10 +0000
Message-ID: 
 <PA4PR08MB74112856A6C77EB7633A4CACE8C99@PA4PR08MB7411.eurprd08.prod.outlook.com>
References: <16EDB6E08F59A6D2.10350@lists.yoctoproject.org>
In-Reply-To: <16EDB6E08F59A6D2.10350@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 25be07ac-b562-482b-eec0-08da326e473e
x-ms-traffictypediagnostic: 
	DB7PR08MB2970:EE_|DBAEUR03FT048:EE_|VI1PR08MB3264:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3264482387B6C12D1F3CE631E8C99@VI1PR08MB3264.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gahWBQzVIEuml/ncUtGPSg8kEWDXZLH+ql2aiP9tEEyGfg1Jc8MODcJ1GBSETsKT0esoYPWC97kHgNrIvKjSegM6mGaWKTOfmt+ICbQfk7d1terxuMA5TmmN3heJ/WBHwQDnAUCdXXHXEJLqLTNrUcn2swsxzBZIBEjs3hhtcnqje//IRYN40h9rYm7HluHSu6/uoTafhU3/Uqhnfs50qsK01FEH1n384aXBlE8rJ+c7fG/PfVlNanidpp/z4yiZPkpCvfsplSrA1CJQe5F77+VThyGvD7K+2Pgc4I0jM5CzrAWfLs5TYiPStjxx+3ocuqGisRQwnTjLA63+Uhi0WWyq3g8g3ndmpj2v8Ujphlf65iYS9jVPXRm4g0NdZOWEbPC5n6rJoHjMSIj09fFN1+IBsi0HVMAaVkziosMDEOyXb6xMAaLf64X/7CHVlcBObQtttZ0uALexVk7dvM5LEcNUJEjXPwFbTXJ9xyEmLDqVu9KatVHI73Mloyb0dMQKGlgrnhZhApiMVgznYJAnVx712bqU/pVShL/LYjlonSUbB/s414H3ZUYobaWrnnR3I3A4RTrVh3fyM+3ruNzpuBylqCXTq5yL2ICqiS6B5KkirDpoOzqSrKvrDSFtYreTe59pR8a2ntWONWiRbEphhh8D1DBoo/uPLxmey6QvadN59tMY9OtvtekwFN3aOwlEsWs853VuuZbVzj06UIuc4L00W4OjYLQD9OhrEek1bGsShndW0sh0GMVXJEtzSCHOxastnMS0ap0vO5m8D/ji+xH53aw7NywBz3RHDwXfHVw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(9686003)(26005)(166002)(122000001)(38070700005)(316002)(66476007)(66946007)(91956017)(66556008)(186003)(64756008)(8676002)(4326008)(6916009)(66446008)(71200400001)(5660300002)(76116006)(966005)(6506007)(508600001)(86362001)(52536014)(8936002)(33656002)(83380400001)(38100700002)(2906002)(7696005);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PA4PR08MB74112856A6C77EB7633A4CACE8C99PA4PR08MB7411eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2970
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	937a6103-f653-4b3a-5b6b-08da326e3e92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oNW0EtIaCoe0x04ZxzafEUTWuy5ynIF4kIsfQrPJOPQNLvy3HXkrvBdcUn9Id9ukvDGRarCJA6PLJYAdGGA1yiAc94con/eZuPnnHQ6Ygoe3VCFrFncW0icAN8CAAI8Zn/feUNxlyEwYPXbf7hGb1IdCmzpdZJ51KjYFnbOySajVBUiK2zyoV48QWzQhIUnrhASnZ33FF7h0f+Vle25Z7PsOrFh3kjc29MwxpzQhlQdOFt2Oi2F1SU3hyuoAmc6KAsBPuFghdVFXjTAwzlY0jmN/UJzJ2gqlgOkYVE7IzKCnQ751CscNq7UGT4a2uh9bnYEtct7YLLtyIU0D49NuD+GcSc7Qvx/C6ntSzqEyuWjOf7JhH1wckTPErpJIDOlWoHa6WdyPhhTaDjd5yCUsOfukBqOwT3E/GzB6WVGXHuvO2c3jCtnFIZDMuc4YYmC4WfCOapFqvUgdm9TEbtvsj0ImeGcW0BVDHAyjE+6UGqpeQdpdaGJ5urquUZpKj+hstfew0U/hxFbapErxwe235Kf5yLz7OjQv3TWAUPJbI71Haqv5PgpCFXZubuWAsNyetoFZPaBWdc2NflmNLjFSWKTefeIKW7uIsWb84DKUilbg8YNQKqT8n+zyrtqFHlBU0vjG6mBSqL5yMFRJxi4d/QaGld6/Z+LR/6Vy+aQcoW/Wng8jTHEwipED/70rAaRdhCjExaGA1FRCuZbsKHTjcbhQbfJQby5yxe8aThqyewsHyT5cXYz3bnwuJLk+Im4P16+xGzkZn3VsG9pdDtP/6Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400005)(33656002)(86362001)(356005)(5660300002)(6506007)(83380400001)(8936002)(52536014)(966005)(70206006)(55016003)(9686003)(47076005)(166002)(508600001)(316002)(26005)(4326008)(8676002)(336012)(6916009)(81166007)(40460700003)(2906002)(186003)(7696005)(36860700001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 10:17:24.9288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25be07ac-b562-482b-eec0-08da326e473e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3264
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 May 2022 10:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3375

--_000_PA4PR08MB74112856A6C77EB7633A4CACE8C99PA4PR08MB7411eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This should be merged to both kirkstone and master branches.

Ross

From: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org> on =
behalf of Ross Burton via lists.yoctoproject.org <ross.burton=3Darm.com@lis=
ts.yoctoproject.org>
Date: Tuesday, 10 May 2022 at 11:15
To: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>
Cc: nd <nd@arm.com>
Subject: [meta-arm] [PATCH] CI: use kirkstone branches for meta-clang and m=
eta-virtualization
These branches have kirkstone branches now, so use them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/clang.yml               | 1 -
 ci/meta-virtualization.yml | 1 -
 2 files changed, 2 deletions(-)

diff --git a/ci/clang.yml b/ci/clang.yml
index e5e7dd5f..a2063f19 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,7 +4,6 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
-    refspec: master

 local_conf_header:
   clang: |
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml
index 8791fc3b..1cd0e21a 100644
--- a/ci/meta-virtualization.yml
+++ b/ci/meta-virtualization.yml
@@ -6,4 +6,3 @@ header:
 repos:
   meta-virtualization:
     url: git://git.yoctoproject.org/meta-virtualization
-    refspec: master
--
2.25.1

--_000_PA4PR08MB74112856A6C77EB7633A4CACE8C99PA4PR08MB7411eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">This should be merged to both kirkstone and master branches.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US">Ross<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;mso-fareast-language=
:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">meta-arm@lists.yoct=
oproject.org &lt;meta-arm@lists.yoctoproject.org&gt; on behalf of Ross Burt=
on via lists.yoctoproject.org &lt;ross.burton=3Darm.com@lists.yoctoproject.=
org&gt;<br>
<b>Date: </b>Tuesday, 10 May 2022 at 11:15<br>
<b>To: </b>meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;<br>
<b>Cc: </b>nd &lt;nd@arm.com&gt;<br>
<b>Subject: </b>[meta-arm] [PATCH] CI: use kirkstone branches for meta-clan=
g and meta-virtualization<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">These branches have kirkstone branches now, so use them.<br>
<br>
Signed-off-by: Ross Burton &lt;ross.burton@arm.com&gt;<br>
---<br>
&nbsp;ci/clang.yml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 -<br>
&nbsp;ci/meta-virtualization.yml | 1 -<br>
&nbsp;2 files changed, 2 deletions(-)<br>
<br>
diff --git a/ci/clang.yml b/ci/clang.yml<br>
index e5e7dd5f..a2063f19 100644<br>
--- a/ci/clang.yml<br>
+++ b/ci/clang.yml<br>
@@ -4,7 +4,6 @@ header:<br>
&nbsp;repos:<br>
&nbsp;&nbsp; meta-clang:<br>
&nbsp;&nbsp;&nbsp;&nbsp; url: <a href=3D"https://github.com/kraj/meta-clang=
">https://github.com/kraj/meta-clang</a><br>
-&nbsp;&nbsp;&nbsp; refspec: master<br>
&nbsp;<br>
&nbsp;local_conf_header:<br>
&nbsp;&nbsp; clang: |<br>
diff --git a/ci/meta-virtualization.yml b/ci/meta-virtualization.yml<br>
index 8791fc3b..1cd0e21a 100644<br>
--- a/ci/meta-virtualization.yml<br>
+++ b/ci/meta-virtualization.yml<br>
@@ -6,4 +6,3 @@ header:<br>
&nbsp;repos:<br>
&nbsp;&nbsp; meta-virtualization:<br>
&nbsp;&nbsp;&nbsp;&nbsp; url: git://git.yoctoproject.org/meta-virtualizatio=
n<br>
-&nbsp;&nbsp;&nbsp; refspec: master<br>
-- <br>
2.25.1<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_PA4PR08MB74112856A6C77EB7633A4CACE8C99PA4PR08MB7411eurp_--

