Return-Path: <m.grand@trustngo.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FEDC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 16:10:04 +0000 (UTC)
Received: from PA5P264CU001.outbound.protection.outlook.com (PA5P264CU001.outbound.protection.outlook.com [52.101.167.88])
 by mx.groups.io with SMTP id smtpd.web11.12564.1752595799142212395
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 09:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: trustngo.tech, ip: 52.101.167.88, mailfrom: m.grand@trustngo.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/G8nHOihrbYmPbJJ2zaI6WjxFakgz6+MFVMJypJ5vV+j2rjPMeT4JXUNXSqU0/+PFiOwWTIX2xWrzw7xst4twY4PTWPcdWcW5TP3ndxBMpaNrjVkdjhmaoetGdBCuiNSM9CUF0QVsnovdvCYEQMrkexxXAMZF1srZvEGrmRZm/Fp6RS38Qv6Gbj0MDsE6VhDR+5IOEPVzcccBQCsABXNfnV2bGmHzBFUbwRPYdxHfwOSzU5JngN+Nhsevo1G+IUT1ZJr1glIAdXaJ44IzLamIbDHlm1ReCZaM4os9fNqB6nGChGXNLzXbkiw3OlX7iU68T/e20usU/pX3uMFyv/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h79rKcZnvpoSZoJwmSUPP2lbdDWtKdh81ujSB5XLgMs=;
 b=Zmbl2RrvCp6Zhkkqxeu3woMQTh/Jdtv+JyF/ACJiyTdE1v2ByoInt0afSazzx1y/n5q12wnTrSCynr9Skr4xsNctTEYDlcEothXvvxeBmnw/QlOaedyG/YGQS2PnkX33Sud9Or9mRuNFSxtsfPptbqOqpWRAO1mOiBA9SsS3iK9eRCIhiPycqn+l3GV0t5OhFrrSMrFqDqscaxTlA5k4mSaAw9RwzWN3LX1PfpDZRN8G0prkEg8AilgNwjEbHiAhgm3wBUAV4vhbVStYaGWcamI3KH70ijndVnTx6wjOt6Zf8XNf74glFnEo7YfwT+jMMSENGDlkrAzy1O9OSordAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trustngo.tech; dmarc=pass action=none
 header.from=trustngo.tech; dkim=pass header.d=trustngo.tech; arc=none
Received: from MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::15) by
 PASP264MB5105.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:438::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.32; Tue, 15 Jul 2025 16:09:53 +0000
Received: from MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d2a:b4d4:4cc4:2df]) by MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d2a:b4d4:4cc4:2df%4]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 16:09:52 +0000
From: Michael Grand <m.grand@trustngo.tech>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, "meta-arm@lists.yoctoproject.org"
	<meta-arm@lists.yoctoproject.org>
Subject: RE: [meta-arm] Full secure boot with qemuarm64
Thread-Topic: [meta-arm] Full secure boot with qemuarm64
Thread-Index: AQHb9VjeApHhJyqFx0WKRkFOI3LafLQy17fJgACB+kA=
Date: Tue, 15 Jul 2025 16:09:52 +0000
Message-ID: 
 <MR1P264MB1841E8159C0FD5997798FD27E157A@MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM>
References: 
 <MR1P264MB1841ADD5E68964B57B0DA05BE157A@MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM>
 <18525E398D470BE8.3909@lists.yoctoproject.org> <aHYPFA6oxnJBa4_r@nuoska>
In-Reply-To: <aHYPFA6oxnJBa4_r@nuoska>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=trustngo.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB1841:EE_|PASP264MB5105:EE_
x-ms-office365-filtering-correlation-id: eefe8cd0-9234-4385-6e47-08ddc3ba085a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7055299006|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?iDv4Wn3T/f8EdIvx7ki+Kr5VjxDWuP7w07I8p8HDuQL+pj9dZH+mv3/dc2?=
 =?iso-8859-1?Q?UQvix665uPIBjyYaEVfWT2y4n33mNAPCXRjWnPs5B4X5CNbLnJpj8Fm+p1?=
 =?iso-8859-1?Q?M6eKn7EmUQYYD4PKBY4UWJAfecPtJrZ+GMLMlZZdyb9F/7WF00phIU32sw?=
 =?iso-8859-1?Q?21KGix6iMn1vybZM1AWW19Qgf5yIhBOiLLZwcAAfUTym9a7fv8DIrR2V/1?=
 =?iso-8859-1?Q?Q7Cod28jaIqgUAiTPtsJ0mwRazUeY49j51wAx5Kg9+xT4s8sCGrDVs7RNH?=
 =?iso-8859-1?Q?LF3vjj9h40taokbE+66Hlxxu6h2HTK1TObX9irPByQ+JnEWhGJHjNadMlf?=
 =?iso-8859-1?Q?C8M6Dq/w/uR6i5HdLRkY3AqXFsEJ+XElWyukmt5TB8JFnYLCOP72G3FH+x?=
 =?iso-8859-1?Q?Q/vrW8rDHKC2mfBUt6C5ijU4SNvQShW0ehLJ4hoT28YcxbaLFkl1X2JpwD?=
 =?iso-8859-1?Q?jVtsopN27cIYu3L5/Y9tqDLm1zV3fxY8HOARwU9b45/odG8cs4JNn/7BWW?=
 =?iso-8859-1?Q?/+oYqQzg6b65FcYddL8YkTxSACz1FHOwy8xCRSosTXo9r+9QRYPaMW8VOE?=
 =?iso-8859-1?Q?7vf9DhrElrh7GwtRTB8eVKauBjlhCxJ3LscPKsLL4SckxigSMBv9KA7EjZ?=
 =?iso-8859-1?Q?LaHqd0nzup264JAbpFsoxH48vzoz2FGPUcIyPR6n0pe9hkNwvPbtnO2qP8?=
 =?iso-8859-1?Q?5YNi1rwdVaoksUw/WB6zigKpUR/GXAFX3CdOs7UxCrpOcERttj9O4MIkGh?=
 =?iso-8859-1?Q?Xjt46h0yIFzgNt1Uj8r1VAT91V82C1wojtAGiAqgT3pTuhduMo0A6LfV8T?=
 =?iso-8859-1?Q?wgVpUphmMe45Y4P2e3UaamQoCjCjza5MKsAGbE1dJP1CO9drpIlGhlCL5e?=
 =?iso-8859-1?Q?1hI90ky/5UfV8wLx3LtNKMbIvM/pQOWON7JhqZXwngToGHDSelAMsECCNu?=
 =?iso-8859-1?Q?QGx083TaNECejGg6LEkANzIvW4CdsfYLn4qdI5DRdChgK+VWVynpdN1gkS?=
 =?iso-8859-1?Q?T+Rl6uGshoqPvKrU7zjEmDUSOGPZ4RjeIPzgpDhieIZHOsFr/axXvaNnG8?=
 =?iso-8859-1?Q?leWDFotF7uZ6hKDqiqjx2MuJy9oTLyfY1vJCojYoM+V6d6+ibiitak9XJ7?=
 =?iso-8859-1?Q?8T5vnk5iL0K6/eMxGJX4Uz6GoPSQTAS+1d8Fb5GVcNVLVTpFUxtacGZUSV?=
 =?iso-8859-1?Q?9DpK3iv2cM62ezgG22MgjV0LhEIv3E8Jw+cnCC6JIqXRkJHnTEwclxbuEq?=
 =?iso-8859-1?Q?qFZ+WVqzsipwPQ06v0jl1dWSaOLYFHjGgqYRf0ZOVlHF4v/+QZYWFgh93Z?=
 =?iso-8859-1?Q?L1YTNGmz9T3Ez4x1WEjyPmXCjKITV+NYJtedH2xH7VXGSBnAKaOrx58ohf?=
 =?iso-8859-1?Q?OwQZRJEpde3+e0csHKzQ3+hGIDn5I0ropFD/afsB9A+LMLAaeN+MFFQlC1?=
 =?iso-8859-1?Q?I9k41uf9UJ3HxqwWzZ7o7f5bXafB/VZqnlOBZgoCzvpO/hQArO4vhyCDVH?=
 =?iso-8859-1?Q?9nN0aWgYH8wRwZHgFs5WiGvh11LB2dIGWdB8aabpv0c/PA0wZHJax8WCMH?=
 =?iso-8859-1?Q?frRLTJxOuBOHG+s7Cw26w8Twjm0d?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7055299006)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?to1xQTqPt26IgYj4CzPY8U59f7owOzczQiSl8hfsUuJR46OXNNqk6I+ENi?=
 =?iso-8859-1?Q?8T+EUefIQbqb4KPwuLXmRp6riQHVfjEIoAt47HYPkLcDgs2mF4KB/lB99v?=
 =?iso-8859-1?Q?10uRrbOlGiAtg+NZkntLrfG916lNqE1WsdN1Q9ihkZL9VzglNJJQGFjPf5?=
 =?iso-8859-1?Q?NAyjupLZb8L5yJWz7wZkTapmSkdiZT8a4WIXBEVAclUqwqLOwS5NO49C2D?=
 =?iso-8859-1?Q?m/0UQGU/QDgeT/+WvZrTflDzyJyKuI12mYWm+Uc6d0ljDdIoxE9oax/X4R?=
 =?iso-8859-1?Q?Ln2UnDgv9ixCGJfQ1IM2b63UD0IcHOXbSta86f61OJEQgRTklk7Iqx7kZn?=
 =?iso-8859-1?Q?G0Xn/hqHRkH4YHidp6KKOBom8zAQRwJ1A1zXVSOjdsAO91SggeHjKsiOVa?=
 =?iso-8859-1?Q?RRYo04kWLCbP6nZeMcCOPN5GB6ju9/bEPje0mZYXOTkNiNvWGNtLWUKj+R?=
 =?iso-8859-1?Q?AeZ6koNCm85DXBQKOzcvyfy1M1hj9ao4j/cHlAeHJShubONbC3U4hbAgrI?=
 =?iso-8859-1?Q?ztyyI5UKCOmhvfS44Cwkykfz6Szb0BBEfHKvphFm4k4jhjKO2OmsmnaMMx?=
 =?iso-8859-1?Q?I+pXaLI7lpSlz2w9eBGeu6ccughvJBvqRAsJvM6nF9WjOqM2AKqg+wpPEO?=
 =?iso-8859-1?Q?bJmZ68air7Vd0WgOsibcwmAQIDRZF5ihm0QqGNJKMGsTax9j8LBSZP60cH?=
 =?iso-8859-1?Q?NiDPjwN4d9yVAELGn0T1YQ+2McPOnsT/Tg409iJ5iZdVKglsgLZp/KM3Y6?=
 =?iso-8859-1?Q?p2BKNIYCqfk1Q5xGJokE5PCBOBPREBcDwE2BXPzL71HDeBvfgfzoxtbIHs?=
 =?iso-8859-1?Q?0jm1p9j/8hb+QoX4esnf8DbbyLeEUjeWSFpGpevbHqjbV6XHssd6nDFrN6?=
 =?iso-8859-1?Q?7p7Bqlso+Xm0oN9MumOMjlymLxWtGw6xmBXzoSCh7RAxLKSFEaSECqsG1w?=
 =?iso-8859-1?Q?so0/iptEZQd9o/Fz8OTqnJYqO0x6ocjBOojRd3QUFZ1/5YvuQd+S8zsxGK?=
 =?iso-8859-1?Q?dxc+G6j5zmuIwagxxXy128AtVyZjiGS7tt8YiEJTQCQik827OHB7hR9qR3?=
 =?iso-8859-1?Q?q7moBNOfM/RW/IqeWgVGZBqTJsN0iCZOGMgsVhtjJWqJovdVs0TPx3Gq/Z?=
 =?iso-8859-1?Q?JlUlTmsSo2EWhC1K/KhNEGAlEFckHWymBZmUd+0leG3qt03mFON5pq8HuX?=
 =?iso-8859-1?Q?ljOr52RtHGt2PKVVVjamTTK3PO1fUi49G5/p3g8XDpBdrARWi6gGym1WOY?=
 =?iso-8859-1?Q?BUgiV6zHeQLDDRw6iNk4VVjlmH7+41qZpcwaAmiN5v5VB758QTFW9E7mV5?=
 =?iso-8859-1?Q?bQ9op0nITGq9F5NmRwovuAcC2wMz41Lhy6l83rVMM/L0uHrNHcYLGoAn+u?=
 =?iso-8859-1?Q?r7dMlZUZfx8TslfTlY3odLFT9tcgWANxkt0kQDMiQoHhKMCSbF8dysysDE?=
 =?iso-8859-1?Q?Sa+YRKgc3nli8QEQISbG5xUakrjYRyjInz42gJ+cKvElpvhvxMpVD6vGQ4?=
 =?iso-8859-1?Q?2sybfH/SEY7UD9iXZ+USMEPXPIo7kNEix+ZrPXUMhc2feI2fy6qnxPqgw5?=
 =?iso-8859-1?Q?Eut0EvtMqOzftPxBaLiLz4m1AlphktrTi799yCzDcIFpPiyLRkV6LSlb7f?=
 =?iso-8859-1?Q?YE02eXuZE/Nzas9vRyxNEb87ewpmOp0rPJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: trustngo.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB1841.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eefe8cd0-9234-4385-6e47-08ddc3ba085a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 16:09:52.6907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 280e357f-0dfa-41a5-a69c-e53fb549f178
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WaJQJF5WpfqppayLFNtH5zJGtr6mv9FvPRcGxeb4ZQflOmGscqJcPe1QDWGOywuWxGj0zLrU2Kb9wnTD9wfdeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5105
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Jul 2025 16:10:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6615

Thank you for the suggestion. Initially, I didn't want to use UEFI to keep =
the things simples, but I will give it a try. I was also using scarthgap an=
d uefi-secureboot.yml is only available in walnascar branch but it does not=
 really matter as this is only for educational purposes.

Best regards,
Michael Grand
=20
-----Message d'origine-----
De=A0: Mikko Rapeli <mikko.rapeli@linaro.org>=20
Envoy=E9=A0: mardi 15 juillet 2025 10:20
=C0=A0: Michael Grand <m.grand@trustngo.tech>; meta-arm@lists.yoctoproject.=
org
Objet=A0: Re: [meta-arm] Full secure boot with qemuarm64

Hi,

On Tue, Jul 15, 2025 at 11:06:41AM +0300, Mikko Rapeli via lists.yoctoproje=
ct.org wrote:
> On Tue, Jul 15, 2025 at 07:57:28AM +0000, Michael Grand via lists.yoctopr=
oject.org wrote:
> > Dear all,
> >=20
> > I'm trying to develop a PoC of a fully secure embedded software. Becaus=
e this PoC is intended for educational use, I don't want to depend on a spe=
cific hardware vendor and therefore, I'm using qemuarm64 as target.
> >=20
> > Unfortunately, i'm struggling in having a working secure boot (TF-A + O=
P-TEE + U-boot + kernel) and I cannot find useful (and working) information=
 on the internet. Do somebody has some kind of a minimal working secure boo=
t example based on qemuarm64 ?
>=20
> Check the meta-arm layer and build for example "kas build=20
> ci/qemuarm64-secureboot:ci/uefi-secureboot.yml:ci/testimage.yml"
>=20
> These build u-boot for UEFI secureboot and then load a UKI binary=20
> signed with matching keys, which includes kernel and initrd.
>=20
> The testimage part boots the thing with u-boot and checks that boot=20
> was secure. The config files have the details.

Boots with qemu, I mean to write.

Cheers,

-Mikko

