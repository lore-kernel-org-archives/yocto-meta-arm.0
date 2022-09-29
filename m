Return-Path: <davidson.kumaresan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CCFC07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 05:36:04 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.85])
 by mx.groups.io with SMTP id smtpd.web12.7034.1664429753283053161
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Sep 2022 22:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=y+tV+fjH;
 spf=pass (domain: arm.com, ip: 40.107.6.85,
 mailfrom: davidson.kumaresan@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FGbZtcSGRJVkqJg9zQhoaMkt9TD0kF1OoWInCn9USK59xALQRrtmDnK0SDRwMiKUPjrw7wunNswJ1BIJfVreLtizVTCOqcWzDZWWxWiGmLqQfuaYNinqdBK2bFs03dpKL2t1XmIumcKmYY+Avs4aLqsA25zL+/JTiIe3+BDDbRZdIOMYvZwSW/fS+BdQyliEKRtxzBk3eQfXP7YFu2jKd2tExK4jn45KmWvcC9fjqhQodRU8dW6wJtFqZA59VB0c27eyFNKU6Xo8+NGs2Md5aXo3OetzAQ7yGylJtpUWjvFN1lWkZ2skMhBvVQNaG1BCcNiyYmLitaFiNvfvjmSRXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE4MbBGhL0KK+OZgS4Zr5nmMYm3QsExLnawL9vUOyzs=;
 b=DbU3wSMfVAmq1wSNzx96CBXdhiq2K9cybR0znCMzG27qMNAxfFjd0oOvl63mC4wnz4811J7yARsmwry5167fWGvqzva0i89fHonGCETTaQvRfH5QngVVuZDng9F/8Ps7mvwjHisA1sBcw2KanDFKIKRyESumfdF7MBUY7g4oSOufDSwfEY0/g+KySzZUNfipPgwvMtXKF4/Co2mAkOp6rEeEdJWZmHh6RvsTR2nSu9XaGS8yNt7UZ39kLSzT3rhhCnbUzju+ZCAvLr5fSTu4fJ/4302MUWxd54/pJJ8EGL/LOP5pfTnOKMfzxSo/BAhuAZ7TL7aniyRqjwWxESSGog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE4MbBGhL0KK+OZgS4Zr5nmMYm3QsExLnawL9vUOyzs=;
 b=y+tV+fjHHve5n5JemnLVLxO516Gs1iPtfL5S+9TXYHk4h5EA6SogPSnKbA4+P04q+G1BtU1inRI/MOpxjK5nEvrXTgLkofaG01oDB9898uWPSEF8nN/M1/li4MoFi6c4s7StCT87mcNgauaSRg2c0mexqi9lDBdkOJwlBOW7rW0=
Received: from AM5PR0301CA0033.eurprd03.prod.outlook.com
 (2603:10a6:206:14::46) by GV2PR08MB8320.eurprd08.prod.outlook.com
 (2603:10a6:150:b5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 05:35:48 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::db) by AM5PR0301CA0033.outlook.office365.com
 (2603:10a6:206:14::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 05:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 05:35:47 +0000
Received: ("Tessian outbound d354c7aef2bc:v128");
 Thu, 29 Sep 2022 05:35:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dad51a8c12fb5e1c
X-CR-MTA-TID: 64aa7808
Received: from 8df6de3da7a4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CE3A053B-35DF-4D65-BF12-8EAEA8A9C980.1;
	Thu, 29 Sep 2022 05:35:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 8df6de3da7a4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Sep 2022 05:35:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+UJcZlmB5fn7B7kzdKZOi5onb1tId0E2D5DRZMDTvRDvprqGVgryVgFmXu6Tl5Lv0DEFJD173U7Ean2cpPhTaHWcBf+x1a9O8Wfv9ft2fx8m26jQhlYmeN8ty740M5y9mG7/R3jplZlrOt9QxEsgnd2EBt9kZu9DaiwX3VJ9EL+9HAk1qPggEAXqbReoT8TGCJdJxSrIw/P5bNShlV80oRttNPshj+t/gsGxjjIFh2nTuBhBk+EHyWAnlhUE+thg7Iq0sFUHioW8AU85OjFkYq0IXs8j8YHEeAyRBTpLoxR888eQkSOwQcgNfmIdeE+MoBV8gI6Ud+Nv9mnM5s3eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE4MbBGhL0KK+OZgS4Zr5nmMYm3QsExLnawL9vUOyzs=;
 b=YPlFvESK4M8vf22pB6jVrvPhrNa9Xo11skyQYKmwXjOrLcuF1MUjY6sapV9z1j+YigHnXdGkmmPqAX2tXrYFJMh0Dvu8dDhiU/4nQsx8P4l96jyFvOW4X6JH/jPwlen7wf9zdbCW0ftMZ0pTPTGv7EqB2+y7fR3MZrBHDKOIHKgbiijfyER5Yx2UiiIfzY2MN+fMO8HusE2/pWIE+G4QyPFXeHQ348jqBvtgiU3pEKLmYartMFHkR8uoR1bavm0VK/8ZGgiL2aSewd4TU19mn7j2InT02EXXBdw8005pLdO1ltyponEqwOGgEi8uUDhSxtNK17DnUmeIeymSWi0HfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uE4MbBGhL0KK+OZgS4Zr5nmMYm3QsExLnawL9vUOyzs=;
 b=y+tV+fjHHve5n5JemnLVLxO516Gs1iPtfL5S+9TXYHk4h5EA6SogPSnKbA4+P04q+G1BtU1inRI/MOpxjK5nEvrXTgLkofaG01oDB9898uWPSEF8nN/M1/li4MoFi6c4s7StCT87mcNgauaSRg2c0mexqi9lDBdkOJwlBOW7rW0=
Received: from PAXPR08MB6829.eurprd08.prod.outlook.com (2603:10a6:102:132::23)
 by DB9PR08MB8625.eurprd08.prod.outlook.com (2603:10a6:10:3d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 05:35:35 +0000
Received: from PAXPR08MB6829.eurprd08.prod.outlook.com
 ([fe80::d883:6f6b:4456:57e6]) by PAXPR08MB6829.eurprd08.prod.outlook.com
 ([fe80::d883:6f6b:4456:57e6%3]) with mapi id 15.20.5676.019; Thu, 29 Sep 2022
 05:35:35 +0000
From: Davidson Kumaresan <Davidson.Kumaresan@arm.com>
To: Jon Mason <jdmason@kudzu.us>, "g@kudzu.us" <g@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Jon
 Mason <Jon.Mason@arm.com>
Subject: Re: [PATCH 1/7] arm-bsp/tc: remove hafnium clang patch
Thread-Topic: [PATCH 1/7] arm-bsp/tc: remove hafnium clang patch
Thread-Index: AQHY03MvXfHtkmx77UCYw22cb05Wxq31442m
Date: Thu, 29 Sep 2022 05:35:35 +0000
Message-ID: 
 <PAXPR08MB6829A4C31B825A80147F5A7C90579@PAXPR08MB6829.eurprd08.prod.outlook.com>
References: <20220928145036.47650-1-davidson.kumaresan@arm.com>
 <YzSk1FMklaRmmiZh@kudzu.us>
In-Reply-To: <YzSk1FMklaRmmiZh@kudzu.us>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PAXPR08MB6829:EE_|DB9PR08MB8625:EE_|VE1EUR03FT055:EE_|GV2PR08MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f81c17-d382-4d17-47a8-08daa1dc7692
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NK+YrUMvvfH1UW1+xWY8tvnkhU6/sRoFFyaJYqIYNj58VnFQ1pzl6SRihC4w+arNECtCY4+v028rv5bQKJHaQjq8c9csYKJoUYfpakAM3PX/0bTMVJPHBYNVj8jxHd+5NBgkKMaeo/OruU8LoBOLfyYLmnSJBxZ3pygPv9ZNn+xmxk+Hk2aUfcdAt73N8eTy2pQ1uyXidLfEJ9JBPndbk6P3cgtxdV9o3o8g64U0pfpfDiiz00znO/BXSzk+k38G1rb1xRk5QCNx2l1d2/GiMj2Lxuhj/go5XnLghqHh+jCNErEsaLHROZzPf0QtgafAJnzB7USRflDCLv2nPzscN6oBX2sJKpqj+tyBe0HU0K+IxldM0J9ilVh3Gw9OqX0IUWcAS6zpzhv3F3NgB034YHZqCPxHxiyD1VRQEAUuWRabMpgToZvhwpnm6pxvNk4yCh8tvXYc1td2nRr76v64jU4nskTO8yB0siCtLUJhnIzGJy3aaEQdru2YXUSbY0VlVoThP7Zlhw7paBm7qvgZr1v55gcs7/dXfC5/Vgi9KEP3PYNSQipNLwqwUXQjhz/mYCPyMhrG3/QBPDu2vE563Fe/qNAev9OQPm0p0Ntipd7DlTFige4/WJWUyIDACnjtbdo1ddhe760M6iZqG+LqVGw4QszySvfnJ3QTSAbIc/ok4yxfMRwsVZ9GULG7RJ3Niy6LZz/hvOvY4VPNJrC7SwyxxixSN2+Ejwa5xe1CbJspBSzSBORm4Jn1ZkJr1yT+Bg+7A+HGuJ7Cy+9fE38ZWTDCIQecxBtpjuhIYhZH6fk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6829.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199015)(19627405001)(83380400001)(5660300002)(2906002)(86362001)(4326008)(91956017)(38070700005)(6506007)(66946007)(52536014)(53546011)(9686003)(66556008)(64756008)(66446008)(8676002)(76116006)(26005)(66476007)(38100700002)(122000001)(33656002)(186003)(71200400001)(8936002)(55016003)(41300700001)(110136005)(54906003)(478600001)(7696005)(316002)(781001);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_PAXPR08MB6829A4C31B825A80147F5A7C90579PAXPR08MB6829eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8625
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	611dc0c7-450e-4a8c-e581-08daa1dc6f44
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3vhQR0HCfJGafOZQ93A/HmnkfUKfXXWSsbMPUzCm/EQTDkCpbCxIH5SVCrSI/X1s4eBs/FQDMXkruR01W8Fe19sFso7S3jKEakM7q3ZpKixowxPvLfoUNzx3caTqa/1sr59U4xeD4/omVY7Qi+pcPYfnDtAV9rUurkov8Ux2BmuSl6hcmIHxnQ9f4awrwsZju/Ok0xs+C1m+qZckGi+m6HtVCMTBv9QVJVmxHYK7qAUl1ZZhgLDGRMBx8gt9LY+VWALffyYkmPazOkGR7ubDsJyat0pUPFlp2Ay2y33MouNWcXe/yAMiMmLQOpp1WYwyoGFCY+AnKR7CM9sxNqLDi7bnc7JtlKvQm2NIAxnMhOHeYtlFsqmUkGGWDme+QI3EkCr3nX+OOyjSD0qyaB0dcj61qu34HbEg8Ijr14bPAnLSuHsRBeDP+EnuJypWM3o/iCOoU+8ff4sN4Y4ijFAv5GC+I3O0w/fffyhYR342JnhgwdFDAtGS7LkqHq2DPkuXCrnileKpI5u38Tx4VbzNY2P4ZKXRhoNhHrrERKs4h6YD3ThGu/VY7Pvgos4ynRPjRYvNPhZTVfZdZWxuRFWTTuLLs8nMRFsDhuWGGLs+43VWUDlV9iMn4DXQIJFmD3AI4wVkl4r0d5MAC3YKruzhMxtnrxr9IkIl9v3/ICpoBq9lxX0g707ubx39vE6JoHjxteZ6azrTaq669PUdS/+sxrHj6GKFx3rCN++ZarUNs5v3RpAo2tE01Kf50xfObBGi/3Bj/weG9YFhY5L7HfmE+HRLWjOlOqycDWjjDP6Vvec=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(46966006)(36840700001)(40470700004)(82740400003)(86362001)(33656002)(40460700003)(40480700001)(55016003)(82310400005)(81166007)(356005)(7696005)(6506007)(8676002)(26005)(4326008)(41300700001)(9686003)(5660300002)(30864003)(52536014)(53546011)(8936002)(54906003)(110136005)(478600001)(70586007)(70206006)(316002)(83380400001)(36860700001)(186003)(2906002)(47076005)(336012)(19627405001)(781001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 05:35:47.8959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99f81c17-d382-4d17-47a8-08daa1dc7692
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8320
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 05:36:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3866

--_000_PAXPR08MB6829A4C31B825A80147F5A7C90579PAXPR08MB6829eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, that was a mistake.  Please discard them.

Thanks,
Davidson Kumaresan
________________________________
From: Jon Mason <jdmason@kudzu.us>
Sent: Thursday, September 29, 2022 1:17 AM
To: Davidson Kumaresan <Davidson.Kumaresan@arm.com>; g@kudzu.us <g@kudzu.us=
>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Jon =
Mason <Jon.Mason@arm.com>
Subject: Re: [PATCH 1/7] arm-bsp/tc: remove hafnium clang patch

Did you intend to send this out?
Also, it says there are 7 patches but I only received 2.

Thanks,
Jon

On Wed, Sep 28, 2022 at 08:20:30PM +0530, Davidson K wrote:
> From: Jon Mason <jon.mason@arm.com>
>
> The newly added clang patch does not apply cleanly to the tc version of
> hafnium.  Since there are no plans to use clang on tc, remove it for
> this platform.
>
> Also, use devtool to clean-up the clang patch in question.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  .../recipes-bsp/hafnium/hafnium-tc.inc        |  2 ++
>  .../0001-Fix-build-with-clang-15.patch        | 32 ++++++++++++++-----
>  2 files changed, 26 insertions(+), 8 deletions(-)
>
> diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-arm-b=
sp/recipes-bsp/hafnium/hafnium-tc.inc
> index 4545c829..75707e1d 100644
> --- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
> +++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc
> @@ -9,6 +9,8 @@ PV =3D "2.7+git${SRCPV}"
>
>  FILESEXTRAPATHS:prepend:tc :=3D "${THISDIR}/files/tc:"
>
> +SRC_URI:remove =3D "file://0001-Fix-build-with-clang-15.patch"
> +
>  SRC_URI:append =3D " \
>          file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth=
.patch \
>          file://0002-feat-emulate-interrupt-controller-register-access.pa=
tch \
> diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-cla=
ng-15.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clan=
g-15.patch
> index c376a9c6..f037d2b5 100644
> --- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.p=
atch
> +++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-15.p=
atch
> @@ -1,4 +1,4 @@
> -From 1a84b72df8e749665733c3489f605264ccc63d73 Mon Sep 17 00:00:00 2001
> +From d96f696244e0869654004f49586b53811037db30 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Thu, 22 Sep 2022 19:13:49 -0700
>  Subject: [PATCH] Fix build with clang-15
> @@ -8,15 +8,19 @@ Remove unused variable suites_in_image
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  ---
> - test/hftest/common.c                                    | 2 --
> - test/vmapi/arch/aarch64/gicv3/gicv3.c                   | 2 +-
> - test/vmapi/arch/aarch64/gicv3/inc/gicv3.h               | 2 +-
> - test/vmapi/arch/aarch64/gicv3/timer_secondary.c         | 2 +-
> - test/vmapi/el0_partitions/services/interruptible.c      | 2 +-
> - test/vmapi/el0_partitions/services/interruptible_echo.c | 2 +-
> - 6 files changed, 5 insertions(+), 7 deletions(-)
> + test/hftest/common.c                                         | 2 --
> + test/vmapi/arch/aarch64/gicv3/gicv3.c                        | 2 +-
> + test/vmapi/arch/aarch64/gicv3/inc/gicv3.h                    | 2 +-
> + test/vmapi/arch/aarch64/gicv3/timer_secondary.c              | 2 +-
> + test/vmapi/el0_partitions/services/interruptible.c           | 2 +-
> + test/vmapi/el0_partitions/services/interruptible_echo.c      | 2 +-
> + test/vmapi/primary_with_secondaries/services/interruptible.c | 2 +-
> + 7 files changed, 6 insertions(+), 8 deletions(-)
>
> +diff --git a/test/hftest/common.c b/test/hftest/common.c
> +index 344ff24..175230a 100644
>  --- a/test/hftest/common.c
>  +++ b/test/hftest/common.c
>  @@ -67,7 +67,6 @@ void hftest_json(void)
> @@ -35,6 +39,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>                        suite =3D test->suite;
>                        tests_in_suite =3D 0;
>                        HFTEST_LOG("    {");
> +diff --git a/test/vmapi/arch/aarch64/gicv3/gicv3.c b/test/vmapi/arch/aar=
ch64/gicv3/gicv3.c
> +index 682bc4e..82582f0 100644
>  --- a/test/vmapi/arch/aarch64/gicv3/gicv3.c
>  +++ b/test/vmapi/arch/aarch64/gicv3/gicv3.c
>  @@ -42,7 +42,7 @@ static void irq(void)
> @@ -46,6 +52,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   {
>        const uint32_t mode =3D MM_MODE_R | MM_MODE_W | MM_MODE_D;
>        hftest_mm_identity_map((void *)GICD_BASE, PAGE_SIZE, mode);
> +diff --git a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h b/test/vmapi/arch=
/aarch64/gicv3/inc/gicv3.h
> +index 5faf3a8..f681e58 100644
>  --- a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
>  +++ b/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h
>  @@ -30,4 +30,4 @@ extern void *recv_buffer;
> @@ -54,6 +62,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  -void system_setup();
>  +void system_setup(void);
> +diff --git a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c b/test/vmap=
i/arch/aarch64/gicv3/timer_secondary.c
> +index ebc4db3..8260e10 100644
>  --- a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
>  +++ b/test/vmapi/arch/aarch64/gicv3/timer_secondary.c
>  @@ -55,7 +55,7 @@ TEAR_DOWN(timer_secondary_ffa)
> @@ -65,6 +75,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   {
>        const char message[] =3D "loop 0099999";
>        const char expected_response[] =3D "Got IRQ 03.";
> +diff --git a/test/vmapi/el0_partitions/services/interruptible.c b/test/v=
mapi/el0_partitions/services/interruptible.c
> +index 0d00b16..3c3250d 100644
>  --- a/test/vmapi/el0_partitions/services/interruptible.c
>  +++ b/test/vmapi/el0_partitions/services/interruptible.c
>  @@ -43,7 +43,7 @@ static void irq(void)
> @@ -76,6 +88,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   {
>        struct ffa_value received;
>
> +diff --git a/test/vmapi/el0_partitions/services/interruptible_echo.c b/t=
est/vmapi/el0_partitions/services/interruptible_echo.c
> +index b618cf2..636ebc9 100644
>  --- a/test/vmapi/el0_partitions/services/interruptible_echo.c
>  +++ b/test/vmapi/el0_partitions/services/interruptible_echo.c
>  @@ -32,7 +32,7 @@ static void irq(void)
> @@ -87,6 +101,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   {
>        struct ffa_value received;
>
> +diff --git a/test/vmapi/primary_with_secondaries/services/interruptible.=
c b/test/vmapi/primary_with_secondaries/services/interruptible.c
> +index cc1c1f9..c94093b 100644
>  --- a/test/vmapi/primary_with_secondaries/services/interruptible.c
>  +++ b/test/vmapi/primary_with_secondaries/services/interruptible.c
>  @@ -40,7 +40,7 @@ static void irq(void)
> --
> 2.34.1
>
>

--_000_PAXPR08MB6829A4C31B825A80147F5A7C90579PAXPR08MB6829eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sorry, that was a mistake.&nbsp; Please discard them.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Davidson Kumaresan<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jon Mason &lt;jdmason=
@kudzu.us&gt;<br>
<b>Sent:</b> Thursday, September 29, 2022 1:17 AM<br>
<b>To:</b> Davidson Kumaresan &lt;Davidson.Kumaresan@arm.com&gt;; g@kudzu.u=
s &lt;g@kudzu.us&gt;<br>
<b>Cc:</b> meta-arm@lists.yoctoproject.org &lt;meta-arm@lists.yoctoproject.=
org&gt;; Jon Mason &lt;Jon.Mason@arm.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/7] arm-bsp/tc: remove hafnium clang patch</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Did you intend to send this out?<br>
Also, it says there are 7 patches but I only received 2.<br>
<br>
Thanks,<br>
Jon<br>
<br>
On Wed, Sep 28, 2022 at 08:20:30PM +0530, Davidson K wrote:<br>
&gt; From: Jon Mason &lt;jon.mason@arm.com&gt;<br>
&gt; <br>
&gt; The newly added clang patch does not apply cleanly to the tc version o=
f<br>
&gt; hafnium.&nbsp; Since there are no plans to use clang on tc, remove it =
for<br>
&gt; this platform.<br>
&gt; <br>
&gt; Also, use devtool to clean-up the clang patch in question.<br>
&gt; <br>
&gt; Signed-off-by: Jon Mason &lt;jon.mason@arm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../recipes-bsp/hafnium/hafnium-tc.inc&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 2 ++<br>
&gt;&nbsp; .../0001-Fix-build-with-clang-15.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 32 ++++++++++++++-----<br>
&gt;&nbsp; 2 files changed, 26 insertions(+), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc b/meta-ar=
m-bsp/recipes-bsp/hafnium/hafnium-tc.inc<br>
&gt; index 4545c829..75707e1d 100644<br>
&gt; --- a/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc<br>
&gt; +++ b/meta-arm-bsp/recipes-bsp/hafnium/hafnium-tc.inc<br>
&gt; @@ -9,6 +9,8 @@ PV =3D &quot;2.7+git${SRCPV}&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; FILESEXTRAPATHS:prepend:tc :=3D &quot;${THISDIR}/files/tc:&quot;=
<br>
&gt;&nbsp; <br>
&gt; +SRC_URI:remove =3D &quot;<a href=3D"file://0001-Fix-build-with-clang-=
15.patch">file://0001-Fix-build-with-clang-15.patch</a>&quot;<br>
&gt; +<br>
&gt;&nbsp; SRC_URI:append =3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:=
//0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch">
file://0001-feat-emulate-cntp-timer-register-accesses-using-cnth.patch</a> =
\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file:=
//0002-feat-emulate-interrupt-controller-register-access.patch">
file://0002-feat-emulate-interrupt-controller-register-access.patch</a> \<b=
r>
&gt; diff --git a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-=
clang-15.patch b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-c=
lang-15.patch<br>
&gt; index c376a9c6..f037d2b5 100644<br>
&gt; --- a/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-1=
5.patch<br>
&gt; +++ b/meta-arm/recipes-bsp/hafnium/hafnium/0001-Fix-build-with-clang-1=
5.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 1a84b72df8e749665733c3489f605264ccc63d73 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From d96f696244e0869654004f49586b53811037db30 Mon Sep 17 00:00:00 200=
1<br>
&gt;&nbsp; From: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt;&nbsp; Date: Thu, 22 Sep 2022 19:13:49 -0700<br>
&gt;&nbsp; Subject: [PATCH] Fix build with clang-15<br>
&gt; @@ -8,15 +8,19 @@ Remove unused variable suites_in_image<br>
&gt;&nbsp; <br>
&gt;&nbsp; Upstream-Status: Pending<br>
&gt;&nbsp; Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
&gt; +<br>
&gt;&nbsp; ---<br>
&gt; - test/hftest/common.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | 2 --<br>
&gt; - test/vmapi/arch/aarch64/gicv3/gicv3.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 2 +-<br>
&gt; - test/vmapi/arch/aarch64/gicv3/inc/gicv3.h&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt; - test/vmapi/arch/aarch64/gicv3/timer_secondary.c&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt; - test/vmapi/el0_partitions/services/interruptible.c&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | 2 +-<br>
&gt; - test/vmapi/el0_partitions/services/interruptible_echo.c | 2 +-<br>
&gt; - 6 files changed, 5 insertions(+), 7 deletions(-)<br>
&gt; + test/hftest/common.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 --<br>
&gt; + test/vmapi/arch/aarch64/gicv3/gicv3.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt; + test/vmapi/arch/aarch64/gicv3/inc/gicv3.h&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | 2 +-<br>
&gt; + test/vmapi/arch/aarch64/gicv3/timer_secondary.c&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt; + test/vmapi/el0_partitions/services/interruptible.c&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt; + test/vmapi/el0_partitions/services/interruptible_echo.c&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 2 +-<br>
&gt; + test/vmapi/primary_with_secondaries/services/interruptible.c | 2 +-<=
br>
&gt; + 7 files changed, 6 insertions(+), 8 deletions(-)<br>
&gt;&nbsp; <br>
&gt; +diff --git a/test/hftest/common.c b/test/hftest/common.c<br>
&gt; +index 344ff24..175230a 100644<br>
&gt;&nbsp; --- a/test/hftest/common.c<br>
&gt;&nbsp; +++ b/test/hftest/common.c<br>
&gt;&nbsp; @@ -67,7 +67,6 @@ void hftest_json(void)<br>
&gt; @@ -35,6 +39,8 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suite =
=3D test-&gt;suite;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tests_i=
n_suite =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HFTEST_=
LOG(&quot;&nbsp;&nbsp;&nbsp; {&quot;);<br>
&gt; +diff --git a/test/vmapi/arch/aarch64/gicv3/gicv3.c b/test/vmapi/arch/=
aarch64/gicv3/gicv3.c<br>
&gt; +index 682bc4e..82582f0 100644<br>
&gt;&nbsp; --- a/test/vmapi/arch/aarch64/gicv3/gicv3.c<br>
&gt;&nbsp; +++ b/test/vmapi/arch/aarch64/gicv3/gicv3.c<br>
&gt;&nbsp; @@ -42,7 +42,7 @@ static void irq(void)<br>
&gt; @@ -46,6 +52,8 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<b=
r>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const uint32_t mode =3D MM_M=
ODE_R | MM_MODE_W | MM_MODE_D;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hftest_mm_identity_map((void=
 *)GICD_BASE, PAGE_SIZE, mode);<br>
&gt; +diff --git a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h b/test/vmapi/a=
rch/aarch64/gicv3/inc/gicv3.h<br>
&gt; +index 5faf3a8..f681e58 100644<br>
&gt;&nbsp; --- a/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h<br>
&gt;&nbsp; +++ b/test/vmapi/arch/aarch64/gicv3/inc/gicv3.h<br>
&gt;&nbsp; @@ -30,4 +30,4 @@ extern void *recv_buffer;<br>
&gt; @@ -54,6 +62,8 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<b=
r>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp; -void system_setup();<br>
&gt;&nbsp; +void system_setup(void);<br>
&gt; +diff --git a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c b/test/v=
mapi/arch/aarch64/gicv3/timer_secondary.c<br>
&gt; +index ebc4db3..8260e10 100644<br>
&gt;&nbsp; --- a/test/vmapi/arch/aarch64/gicv3/timer_secondary.c<br>
&gt;&nbsp; +++ b/test/vmapi/arch/aarch64/gicv3/timer_secondary.c<br>
&gt;&nbsp; @@ -55,7 +55,7 @@ TEAR_DOWN(timer_secondary_ffa)<br>
&gt; @@ -65,6 +75,8 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<b=
r>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char message[] =3D &qu=
ot;loop 0099999&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char expected_response=
[] =3D &quot;Got IRQ 03.&quot;;<br>
&gt; +diff --git a/test/vmapi/el0_partitions/services/interruptible.c b/tes=
t/vmapi/el0_partitions/services/interruptible.c<br>
&gt; +index 0d00b16..3c3250d 100644<br>
&gt;&nbsp; --- a/test/vmapi/el0_partitions/services/interruptible.c<br>
&gt;&nbsp; +++ b/test/vmapi/el0_partitions/services/interruptible.c<br>
&gt;&nbsp; @@ -43,7 +43,7 @@ static void irq(void)<br>
&gt; @@ -76,6 +88,8 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<b=
r>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ffa_value received;<b=
r>
&gt;&nbsp;&nbsp; <br>
&gt; +diff --git a/test/vmapi/el0_partitions/services/interruptible_echo.c =
b/test/vmapi/el0_partitions/services/interruptible_echo.c<br>
&gt; +index b618cf2..636ebc9 100644<br>
&gt;&nbsp; --- a/test/vmapi/el0_partitions/services/interruptible_echo.c<br=
>
&gt;&nbsp; +++ b/test/vmapi/el0_partitions/services/interruptible_echo.c<br=
>
&gt;&nbsp; @@ -32,7 +32,7 @@ static void irq(void)<br>
&gt; @@ -87,6 +101,8 @@ Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<=
br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ffa_value received;<b=
r>
&gt;&nbsp;&nbsp; <br>
&gt; +diff --git a/test/vmapi/primary_with_secondaries/services/interruptib=
le.c b/test/vmapi/primary_with_secondaries/services/interruptible.c<br>
&gt; +index cc1c1f9..c94093b 100644<br>
&gt;&nbsp; --- a/test/vmapi/primary_with_secondaries/services/interruptible=
.c<br>
&gt;&nbsp; +++ b/test/vmapi/primary_with_secondaries/services/interruptible=
.c<br>
&gt;&nbsp; @@ -40,7 +40,7 @@ static void irq(void)<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_PAXPR08MB6829A4C31B825A80147F5A7C90579PAXPR08MB6829eurp_--

