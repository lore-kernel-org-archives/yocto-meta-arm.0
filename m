Return-Path: <mohammedjavitham@ami.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A763C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 06:17:02 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.51.91])
 by mx.groups.io with SMTP id smtpd.web11.8867.1745475416003379227
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Apr 2025 23:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ami.com header.s=selector1 header.b=IYTKbX1/;
 spf=pass (domain: ami.com, ip: 52.101.51.91, mailfrom: mohammedjavitham@ami.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G//xAUpXXzcD4dBA14pO7mM68eHxKekXZNmdPiVWKPzu8nBp9Ac+zF6GUJNp2oytEbwiqgMwr8tXRbwxnPvsy/XD5cZhxHmAvPWnWEpvbHB0YsL9OtxvL3PSweMx08faGxFAw/K4ZVuwG0UerhXAFGkUklAMyGYv0Wm9TL2OksyeB0+kcYnoLZVOSFxHwJxFbR7ORkNpIPTXByYup0Ma08uUn+oXWtu4gWF5Kvkl28pxX+F/McLNPWhwzkf31W7+Rra2W1dFzUNRKWbZkMYKUeaUPMkMG8oreKy0KxIkgcq+mAGuOvfBLZlKWxEuNGlMhcnPPODa01FD0IkiRzMRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRQSUUXiOOk9W+inJkYMxkqZ+Gl3snc5IEvIlN5ync8=;
 b=UnnKBHONYVzTlMJ1OH/V+ljZ7vXIp512pZk+hBlygWuPa6sEVMdS8FqQ9KACgDHQytpNo6I308RXMKcJfqFxaqi+ZD5cFzYYHpbQyxPMY4oJnss9OoUjk2Td8kA1jdO14wFc4VSJtwaV4PQsY+tpAYKFWTPMT1Q74vitvNlw71dw37VNatacroP1Xf5s9YyZd//rUch61V3LczfB/m2GdRbm+dJyQVwHYa/3o8pBy4iALU13PckWnHI2NvQAS6u70k76aDymmLSf8/h9lxmhaJYK8fP0iOFeizjafLl9HKJKb3lW4TkSGBmzDqS3lXHr2ImZ9+C4KTAjGuJ6ReoNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRQSUUXiOOk9W+inJkYMxkqZ+Gl3snc5IEvIlN5ync8=;
 b=IYTKbX1/3jPBvPQX6psBh2N1G4odrlNL8efZjGVJOVZBKSYSlkcBvZtxfwyE2DdsAOyM2/jjrmH/mfCOCOP/Ktuc5ha6NM5HG8OpYgoilQPvwEZ5/w+UfY7uaqgE2qMN3Wl+c/y/1qJSjbwe8DNYeme6snsWca3x+cSdN0D2Kzg=
Received: from PH0PR10MB5545.namprd10.prod.outlook.com (2603:10b6:510:4b::16)
 by IA0PR10MB7183.namprd10.prod.outlook.com (2603:10b6:208:401::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 06:16:52 +0000
Received: from PH0PR10MB5545.namprd10.prod.outlook.com
 ([fe80::1779:e8eb:2437:122f]) by PH0PR10MB5545.namprd10.prod.outlook.com
 ([fe80::1779:e8eb:2437:122f%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 06:16:51 +0000
From: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Subject: [PATCH] docs/runfvp: add FVP_BINDIR configuration information
Thread-Topic: [PATCH] docs/runfvp: add FVP_BINDIR configuration information
Thread-Index: AQHbtN97JtUrpMP39kWRy0gh7QeLuA==
Date: Thu, 24 Apr 2025 06:16:51 +0000
Message-ID: 
 <PH0PR10MB5545853883A0B60E30AB4735DE852@PH0PR10MB5545.namprd10.prod.outlook.com>
Accept-Language: en-IN, en-US, en-CA
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5545:EE_|IA0PR10MB7183:EE_
x-ms-office365-filtering-correlation-id: d15bef9b-327b-4c9d-3a29-08dd82f79a79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?eVyagxRpDX84sE+Sg0zqk2vupdVD/yf+zCbc5rlSQl8Bc9Aztbg8iQE2Ma?=
 =?iso-8859-1?Q?h8ZdKKy2ssCbNcKZFrvrXqCmFkUKn+zKQFH1ENGyqInwfVcoionmm9Uxzl?=
 =?iso-8859-1?Q?BSG4fmj32Ox9vUT3jzc+yLU106kew5IpCOY1gQZpVL6q12YEdEHXTkbNmj?=
 =?iso-8859-1?Q?oCp+OROEv8K0WiZLQ54n6vqUETcq4vami47E3+lDnx2MCqbIw+ss6Yl3HS?=
 =?iso-8859-1?Q?Hor7BY2f9248xNLZpoPGajRcrSbRqIArP1BOmXRjo7KbhvF57TYijHPFG4?=
 =?iso-8859-1?Q?VI58+VG59rEmcWHmBCJ9IwzC4FXxhSJHQMvhHpJeUhc4MW4/aQd7szUFvd?=
 =?iso-8859-1?Q?nZ09o4naehDtLvkHFfZjf5XKRYMqUXagfHBwVxGYVcuBa4wt0S0BY13467?=
 =?iso-8859-1?Q?zpFlLMTle/mAHuJFqPQppqBdoa5MIDDfv9WQjBTR3JecFSTu4jdRj1MBrL?=
 =?iso-8859-1?Q?8HvbQ5NxU9roEsHrfvnjPfEtSS4u8Dvpr0X5Ocf3dv/hIackHD4PxQ3ocw?=
 =?iso-8859-1?Q?qnw91Y5zl4raBtC0eUs5FrCm4nZOr5gxNwVn9oPN9D6VEOxj+HAaw3Uaax?=
 =?iso-8859-1?Q?o0JEUI3JtCWjUdUe7YflrwVsQrFWSufCzu/VmY4i4krZoUxt4YeUMnX1Nr?=
 =?iso-8859-1?Q?Ipp+vw0h0nf0NMP9deiB/vagitDuq/8P3kMEqOdSq0TDBqfvzRkYEkAQLs?=
 =?iso-8859-1?Q?78E6SIEffGur8/AyKm8/uJkWjlvp7MR+pwyBf/MwkKt3XMMj1nsCju2FEG?=
 =?iso-8859-1?Q?QIUrepv8rFWrtH96SzhNgGclrOCeo3Fe2HrL4bUUgXkodKtye+swd3x2s0?=
 =?iso-8859-1?Q?4JqFp/ibUXWVXma5FUaPPzkGzRxyQOTW4BooVIFeS5vyZuVLvnHKeWM0uQ?=
 =?iso-8859-1?Q?OtIR3gszw6ZOln5/iSqKWW7+cQFeYTEbmQoLhqE0BroyWl5qgHlmaaDeNl?=
 =?iso-8859-1?Q?u0TrqVEplMqsrz2a7ChVn7NFajypb/M89kcCddIyN1qVqmhnYSdm2dCSh5?=
 =?iso-8859-1?Q?leQ4ePICQV5hQqtpfAarvG5q5eJ6bL4iXiMwmSM+zyx4T3X58Ts0jSqtEd?=
 =?iso-8859-1?Q?EUdP/tN5PND/7IkE6mnZ7HQr5bqih7OOXhNNghwuRTwaIkzGSs0P5OTzoG?=
 =?iso-8859-1?Q?ZL0K74p88bqgkKYHUCCaHxcW8+iJTb3NCcwn5SJ8jGAvZzvNgKNIu2zvjs?=
 =?iso-8859-1?Q?IizAuHWzTLtVNo1cLDtfX5+V4qwr857+YeLO6GQO1OlWIwT9XUERGBKCMx?=
 =?iso-8859-1?Q?DYpsaMIk3sGMWi3nuqoARaYP50bBIglU3KbU1NY7dUuLAyTcXXXBtHACYI?=
 =?iso-8859-1?Q?YsGaqnmGXI/+6NQSwDZ2GqvtiR6mC+F1tVo2k6Xzsx5frWuc0R34q+Rjoa?=
 =?iso-8859-1?Q?AQ67FDE6wR8xwyiw+zL4GAS0qA9xh4rzbmhHzKVW9ZIpuFmx3+rHTGu68k?=
 =?iso-8859-1?Q?FZZM1wCBHIRvOgL9F8geEJaiCGGmpUfPUSJfpX4+vVtS/RLnD5ddleEklS?=
 =?iso-8859-1?Q?Hgds4CqtV4LCnzfy+htvO3gEkejqzaZKfuA91PMF4XHkXPcqBK1GFQiE+p?=
 =?iso-8859-1?Q?EUkCnyY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5545.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bFQZE1Oak1O2TcgNrymN4qg8L0rdElGnAuDIWqFlL3fzMDeRIXqymvqm/i?=
 =?iso-8859-1?Q?FrOLRORNXTrMoCZgUmdvCgwjUFD0NhvPkmGsXgflSX6yg/TelZfdKpBa4S?=
 =?iso-8859-1?Q?JKQtrAL7ataBLm8umASam22Op92aL7lwK1F93iqQLrBNqcKozO/71Adfbn?=
 =?iso-8859-1?Q?NjflLftGzbTuCYgbFHfy4QFaYzQ1QreG4Ngt+CMYud3j4WTKdCfCC9KMfP?=
 =?iso-8859-1?Q?gyeZnbvs8mHHnGxU0Xkc4Pv6cQbPM4SyNAhN1h3FU6Hxz17PkfAlIe3Sqz?=
 =?iso-8859-1?Q?uD/RAMDCL3dBFVnqqbqyE5YQP5G3wBmk+7JLB4690K0PKEXn6DYjnkyszS?=
 =?iso-8859-1?Q?BoIbICbCjwUZhWboxBgYxgtfdUVG5lMeSa/My/jmKbcTP079xH58J6kqDI?=
 =?iso-8859-1?Q?k45N1Fi9YhVBrjTwi+gCxCC3Fakujf8jnkErURp5Vur1UolP99uta93MBU?=
 =?iso-8859-1?Q?8et/tiMNaBdjRdaME8+kV6xuc6XM6oUyYD5Thek5ZBh/InwoSPQ5cWMr49?=
 =?iso-8859-1?Q?RaoJYUblW1Zt0D9z0I2bgz/269eFe8Y7b3Nyczb+ejjaA3cKVTYaJEQkiz?=
 =?iso-8859-1?Q?o7yKliHha/U5HGpocR80RqqNkqJK05o/lTe1Liw4d5dEHbnddMtCBx4iu3?=
 =?iso-8859-1?Q?YHYzzioiDacF/x783J0y7NGe7G8rdaxc554HLDzQ4ekHWSk2A/3MnRF/Wh?=
 =?iso-8859-1?Q?eGhCnKjhctLi7gGzNJQ3VrztauNeFFoaKXM3Vu0DA/lTd2Wy38S19Rc1fb?=
 =?iso-8859-1?Q?rJZxFEtSIi76OU4GXLS1gROTNcIT9YGBld7L1nApLKNNZe9TdOfpUlOh7h?=
 =?iso-8859-1?Q?pbMnGIsEhCg/T3TVVYskqy+xxSNGO9C+EZVzRwnjP2foqW7XBn/UEiznKR?=
 =?iso-8859-1?Q?4hdx/EwvRXji8Fuq4nHoBqGdz69Er3shyM5VJcJ3kY42SUqSiqexJ59MZq?=
 =?iso-8859-1?Q?3Lij1sNEZ6k+x6cRq4fpOn0AMAJtBhd8rP9Ozz4HHu4UdfTWoXgTopD+II?=
 =?iso-8859-1?Q?ZQVvr2UttSv6DEWcywd8PvkY7h2rgTg/LJ6MhaaSIPZlmVvRy2w2bvS7uF?=
 =?iso-8859-1?Q?aZC4mDLfUhX0sfrHCth1SLEA3/MU1kE/IBbQPJE5MzDIYAN9Lm+bK5eXQ/?=
 =?iso-8859-1?Q?EemTRYdmFZFe1c0mB9bw7kSj6VeevVgG01Tvz7Y0BeFZuqIa54v3owK56u?=
 =?iso-8859-1?Q?CGW3C3ZIjPtr3xUkNxvZEc1qkl8Ch2TExbRANzgL7AWCZWYYvldUMpKqBz?=
 =?iso-8859-1?Q?8BYyPJHhMIXbDjysAtWZeJXWNM7IeuX3+mVKKepNj6kNVR3olrN/7uYeVO?=
 =?iso-8859-1?Q?s1q13hKhK80FpK0Yd2DzXKXJei+GVRpuQGh4pJwlCT1Q+Ae6zM1LvIle4h?=
 =?iso-8859-1?Q?JlPBD7a2FVz7ylcNK/70giEP3dPhyixof7TYSSx/zKhegophufbikP4F/p?=
 =?iso-8859-1?Q?vxE6dvHaIHFgpj2OtbTcDMuM0hTwwNuKdf1fn8gcRs781zLZggSGZFEMex?=
 =?iso-8859-1?Q?J0WicgcaLNMHm3laS0oEVkRewWmVQosp43hFgrig6I1ejvKWh8MExV6mWQ?=
 =?iso-8859-1?Q?HBzqHWAm+Ge1duV1YBc/+TlfWC6uJUvN3zePgJtOsL4Z2NUkjdDhY1R++O?=
 =?iso-8859-1?Q?Q8L7w3UcJKvpRC6/S2gSZ7R7jfmIat7FCQ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5545.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15bef9b-327b-4c9d-3a29-08dd82f79a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 06:16:51.6552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RFC/O0JQLmJ2/q16WIALkDw9p2E2ZpX03ajphn4vzPyc8xs6whLVUS5hfFo6D5bOZCvewHPcD8xp61JJz2YCF9YbubREU0rGIvkuY7Qtxc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7183
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Apr 2025 06:17:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6480

Related commit information is given below for reference.

[1/1] arm/classes: add support to configure fvp-bindir
      commit: 42390742b10a62658d7cdd941d7f8f26c185c38a

Signed-off-by: Mohammed Javith Akthar M <mohammedjavitham@ami.com>
---
 documentation/runfvp.md | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/runfvp.md b/documentation/runfvp.md
index be2d8614..d1331101 100644
--- a/documentation/runfvp.md
+++ b/documentation/runfvp.md
@@ -59,6 +59,16 @@ There are recipes for common FVPs in meta-arm already, a=
nd writing new recipes i

 If `FVP_PROVIDER` is not set then it is assumed that `FVP_EXE` is installe=
d on the host already.

+### `FVP_BINDIR`
+
+Optional parameter to configure the path of the FVP binary. For example, `=
fvp-base` uses path from the build host by default. This path can be custom=
ized by configuring like below.
+
+```
+FVP_BINDIR ?=3D "utilities/fvp/usr/bin"
+```
+
+Potential use case for this parameter configuration is to execute `runfvp`=
 script without the need for bitbake environment initialization.
+
 ### `FVP_CONFIG`

 Parameters passed to the FVP with the `--parameter`/`-C` option.  These ar=
e expressed as variable flags so individual parameters can be altered easil=
y. For example:
-The information contained in this message may be confidential and propriet=
ary to American Megatrends (AMI). This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their desig=
nee. If the reader of this message is not the intended recipient, you are o=
n notice that any distribution of this message, in any form, is strictly pr=
ohibited. Please promptly notify the sender by reply e-mail or by telephone=
 at 770-246-8600, and then delete or destroy all copies of the transmission=
.

