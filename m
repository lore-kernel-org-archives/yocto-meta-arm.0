Return-Path: <colin.foster@in-advantage.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAA9E98FDE
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:24:08 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.132323.1775741845658778970
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 06:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@in-advantage.com header.s=selector1 header.b=tfaylf2o;
 spf=pass (domain: in-advantage.com, ip: 52.101.193.141, mailfrom: colin.foster@in-advantage.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBMYtzfF0VZJccZ+HEuAl548E+bLJY09xA150A+IqBiTXKo9UwE+WuAUJWasVH2ffLlJA/MXqZRPolE/FxI/S0Sf5UvmpdcKxg2tN4G1lwJ2eHJY0U6Jq2qKN5eWEQwNo1siOc475kDq7yVnU35zeoVvr362RFJV5T5yWwyKPMHH9yFTjS4YoOoLmsdPbnyPrp/qMNEQiCtxfKzstiyrS3MjVZJoXQ/u395SV7s1bQv2eqIeC3U3jCtrDeRY88qZ8NeI72aFay2LVpUgx2X+KWcrrSrQ8ZuNIs+07SDhV0MhRNBWIRhX/Iq0z+B0D/dXDEj8ftsTXGqSUiD9oQWvnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1o6F/6eRrB4WZLSY2zLCLK34Cq47VOfdOMSj6bsLWlo=;
 b=CF5pvH96WmVRbqwZ3ABisPmYgNz06p5aTjeQRq9XyBRuFr6xdDO6i04Nxu3WZYGXdF8QOaloLwIQK69zVWutOR7LfzwEE8ZhZxAfHzq5AlSYjwMYoGK+EY/BEes+pJjT0sE41Wm4pQC1ncBVKvl3mfnXWs4ChFyDun7zjoCPG6/3VVMViIh+9zM/7P7fAV8ol1/YgK1rCra44K+TvjYctz/gsbEiL4OgwGYs7PtL1VIHckIE22itHuf1da3y+56/3OpaVaUElfIxF5HPBowCKqYvKe6dM7lQfHbN4hugjbFOCvhyXmgc8iRR8LrxW8Yjz+ki0CYHJKZ55VaYRhjmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1o6F/6eRrB4WZLSY2zLCLK34Cq47VOfdOMSj6bsLWlo=;
 b=tfaylf2oPev6ZyXoiXEtCNHSxx3+Al0sWc9EKKa/1rWMZlop3QhEBxtqYKxWdQTwrT2MR6i2RHzs7zSqo0Tf/08NG6gRChYTjC8NR461GZZAKVTQQoL06ATU/FUCrE8kCXnJRbzUDmAnzVc6UzOuE5IfvfoEC2v4GwFnLUcp9Y8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15) by PH5PR10MB997758.namprd10.prod.outlook.com
 (2603:10b6:510:39e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 9 Apr
 2026 13:37:22 +0000
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::14cb:9d8b:4c6e:6f3d]) by DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::14cb:9d8b:4c6e:6f3d%4]) with mapi id 15.20.9745.025; Thu, 9 Apr 2026
 13:37:22 +0000
Date: Thu, 9 Apr 2026 08:37:20 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: martin.jansa@gmail.com
CC: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] Git repo down?
Message-ID: <aderkJBzePjUhpqY@colin-ia-desktop>
References: <adegeIztCtiLd_CA@colin-ia-desktop>
 <CA+chaQdUCdV++-CAayMZyH=e9BLUcjuD9SrKwUfR+idZ4mhYAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CA+chaQdUCdV++-CAayMZyH=e9BLUcjuD9SrKwUfR+idZ4mhYAA@mail.gmail.com>
X-ClientProxiedBy: CH3P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1e8::20) To DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF3984739DB:EE_|PH5PR10MB997758:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e1f4b44-13a3-49a8-e245-08de963d20cb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	7hVa+CX0AEpzVIbDRiwxMYzD3rCXHdi5UCudViZYSESjvqoIKHfJ95VJC/m5O+zG4jwDWJjtR+DcK76acSrAzTEfc9PKo4+DFTVOaJokduCQ20ff5RQDPmR1uWvRIussbMF6oI6Z7D6lOPCnUgGp6c1XL7AENwslBM29GUQK6RJCX7gaYgm10NB84ZJhEF9qQutVy93zK1YWW2z1nPPHmQGZ2rAb3DNpOcXPQB2zr9hWWdcmUEqHCI2LZUDRJfEBL/WivXhZHLN+GB9fn+nFqxjzp54CE36UXq0o6EEor5H2W58zv3oOwnMQ+dXwNuhJQS5DCycw30vTA5duCaViRVgVAvFrAD8Ct9HhU+vqAM0x5DbOZntotBBJirvjgmEH6d055UUYblNbk33fcq0pdrVYWJfpUPh2cxSF2ipizOsOAqJuw6VhPBGONKGotuwGossiR3YX/RMxtCFiJXKE7Bp7xLUiUsh4W7DbWQwtFN5IWPTDeNJzrsl+0haPCTUw9n+uPc0cAyfR2o5TFqmQDLBLNP/YunVxwZ3LTa5BDYgsXz4wgkh3sDQ1x5OyKn8mgCb6weMND6F6w61o/96ZcuPrEt4+e0attI2k5CCFdqn8/e6tbmU+BLWFAUwUvj7dbvl+pES6u8GK34XbF10Wij9N3d3qUWBDH1Cgy1ENVGEggLHGyX99wy2Ab/vsCYUg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF3984739DB.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j6EQ+nGCPNTEpS/FvIes9YptS1gqjyZlc78lu2GW1TDY+M5cKbwM3i20ma6m?=
 =?us-ascii?Q?tBsSG3mCWmDPezYsE7ci0lecBIqnVJRCSDhwIDvwTRlTsG0krvFnQgOoqUZy?=
 =?us-ascii?Q?WpvFXd5U8AT8vFgImcdftsuB1432ZcPpr7pQt2kKevXQeLVLL4P/Rgb+9n2V?=
 =?us-ascii?Q?5WznVuBdy6KA6rpOJcoaOxiAXDxhXZWi8HyXKqOc1sbqrE6fWl2JyoukqDcf?=
 =?us-ascii?Q?lhex5bzfZTSmG7bQI6bpOjyAgOs39BcADt4bT+K0fhMaTlJPFy1X+jp1XORq?=
 =?us-ascii?Q?7YIapiZWuZ1aL1Hz2tOCxJzpC/Cxb0aRPzEDT99TWOyj/04noORCqWM6Y6L6?=
 =?us-ascii?Q?tKIRMjsLbw2KGfH3ADgkpseJWQOxLpMK1B46Srt1Y5ObEs5xbfL1GKk8XKF6?=
 =?us-ascii?Q?cJQnwXHhaCXI6panz9pKmA6LVaYk0BG33wqB7b0njVqRYily+NIV+0v1Vri+?=
 =?us-ascii?Q?XJD1Z8iVF2I1pQrDah9s3zMtmSrNco1BKJJrmmKcZP4jhG3eye2FQb4U0+gu?=
 =?us-ascii?Q?zMjsZN5kqpNc5tmvc8PucZuEkWbmWIfATIL5aoNuTW97FQptnaVLWwpNvd7t?=
 =?us-ascii?Q?hVHKdveQRaA9VTyWYe2qQFkaifJdl+gH0blNv2dWYlIFJyhqI6dlKpdR1XCQ?=
 =?us-ascii?Q?lK8lj4n/MiHMCna9CWKR4JJYpiBvDzfvSFen7rL3P/5NqC1TeoPILmonWxMk?=
 =?us-ascii?Q?LLXlV6G3FkL2v2PFUsE+3gbJipDF9EBX+CQoiyq2iwip9ziInQ5PizLqy4aH?=
 =?us-ascii?Q?feLuEMQnDraEVkOv8+94vrB1wyi/VSluv5KINN6iMUrqtVdQIr37Il8IFTpi?=
 =?us-ascii?Q?+9GRG1DNFqRQwN7d93VUGbwjstwXUVrSdt8AhvTbzRk5x/Mj+X6Qy7Zbm1q8?=
 =?us-ascii?Q?7DxG/ziLyyGsxTQQbs9UNRmI26oDVSpan78qwqTOVz/eYOWA1uY/KiA8NSt/?=
 =?us-ascii?Q?rRS6eR88Jgre675rwHmq+a08HHTcMj/9K1GNW/09LPy2HLVFEhxx4Gphnvns?=
 =?us-ascii?Q?BZxYD5Yvy5wa8ivEGStNY6JPUoCRSvIAVYY0ZwKmW63H828HC0iVmCpBmUHY?=
 =?us-ascii?Q?fiobNZorwLH3qcoqe1H22fH4sk+/ZQhc5mAWqZNpep9NJCdfpNvpvO3mBTFH?=
 =?us-ascii?Q?jOq4j8Kc5+05c1+mm3wP0C2gd3hcKxpEx6TpabIy0PbNxsQndBo3T/Oei549?=
 =?us-ascii?Q?prnQaGp3aAYYuPDDRvIBrPtO5NgrxuGtBa0yeRM6iGDhQ/wGvFkYIDiXxPzd?=
 =?us-ascii?Q?kS039K0iuzBMLTdHh54T55EZcixzePuJJ2Mc/NWtP4TUawxJdvKKRBQilX8v?=
 =?us-ascii?Q?ti/hkqLMvVc/lXMIwPGxysqt8TbpCXPAMekz7AmRzjMVbOxQcwYMLsimprGe?=
 =?us-ascii?Q?FCVwQysrgeJrO/YK7k8WGKGfeveF5ZnMcxUAkrX8TE45wmYRVLwCSqFnzgCa?=
 =?us-ascii?Q?oi2NBCfGXajrSVE0Mxv4zh1XkZJDD8L1gb4CStgsW03fBIxqjpZ1pPbXSTTB?=
 =?us-ascii?Q?DDM1sEyyyTFAi3uBDlyjdzUygTiMYYLOoz+ZEdK46E16VUUVl6u3KDc24rAv?=
 =?us-ascii?Q?eU5VOvf73h3sKNMJjsqHusNfKlQ9+kJhX2T3CwMoFdEP7s1tzGc/9gv0GbJR?=
 =?us-ascii?Q?EWPwKldyHkkwo9XIAsynLfkSbSdI3nAkPSEDODiko2e71YmjPiS3CYsEaCny?=
 =?us-ascii?Q?+014dOlMawxDineKZEjLzIFWa/KEaPxP3rSzqI+u32Tn0cmO63ZDxCCjVX94?=
 =?us-ascii?Q?+gMOvmJiT5Ddc8EU6+WOmOymYcl9Hh4=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1f4b44-13a3-49a8-e245-08de963d20cb
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF3984739DB.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 13:37:22.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6ou/hcx/E326K3iQi1zdauTPDl1b7g2SJzPywp4/QwaRgh3rxnqlqWyCXZJXR2uxke/A/HWfPbLVeEkWSGQ6M9mGppmuV00SbTCR1Seykg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997758
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Apr 2026 16:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7012

On Thu, Apr 09, 2026 at 03:10:13PM +0200, Martin Jansa via lists.yoctoproje=
ct.org wrote:
> [You don't often get email from martin.jansa=3Dgmail.com@lists.yoctoproje=
ct.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdent=
ification ]
>=20
> On Thu, Apr 9, 2026 at 2:50=E2=80=AFPM Colin Foster via lists.yoctoprojec=
t.org
> <colin.foster=3Din-advantage.com@lists.yoctoproject.org> wrote:
> >
> > Hello,
> >
> > I'm curious if it is known that the git repos seem to be down. Both of
> > the following links seem to fail.
> >
>=20
> See
> https://git.yoctoproject.org/meta-arm/
> and make sure to use https:// protocol to fetch it.

Thank you. That works for me.

Colin Foster

