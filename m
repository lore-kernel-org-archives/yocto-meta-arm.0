Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.71])
 by mx.groups.io with SMTP id smtpd.web10.7126.1588928476803475063
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 May 2020 02:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=l6/Vr5Ui;
 spf=pass (domain: arm.com, ip: 40.107.7.71, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57qkrvi18zOtC3l5ytiB4/5QhMTnhblAxz1YEGTGd5c=;
 b=l6/Vr5Uiq364aRG14SipT1YnAddiOCDI/XN1eUVCF+zBJLq5WqzQvXC5U7Uoq0XWPNkqKE/Pxy261lgcRUM+BJLvu+87keRgg+hVf8orkNFwkBJUkiP5wSjTrhyC/K13Hk5RGdRqHHObvzdtn1ebedGE9s1H9XV31zm3Vu8J8/w=
Received: from AM6P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::38)
 by AM6PR08MB3893.eurprd08.prod.outlook.com (2603:10a6:20b:8d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Fri, 8 May
 2020 09:01:14 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::ac) by AM6P195CA0025.outlook.office365.com
 (2603:10a6:209:81::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Fri, 8 May 2020 09:01:14 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Fri, 8 May 2020 09:01:13 +0000
Received: ("Tessian outbound 11763d234d54:v54"); Fri, 08 May 2020 09:01:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9be6efc0d7d86a5
X-CR-MTA-TID: 64aa7808
Received: from 547efba85ea9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A97A816B-A575-4085-A8B1-0AFE25D02BF0.1;
	Fri, 08 May 2020 09:01:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 547efba85ea9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 May 2020 09:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4hkJp0pWaDIb31ofEYExwfVJaZEXg65L/cw0w8J2YF1RXjWQeKI98JpK0O9FJrgExH1Vb1d7LLTmxofV9tuHEzJ3UC3VLm9xpDSF2M8h2VU4RR39a1t8g5rN1OugbuOk4Z3IKFxNme3DfH8BSQd53ITXP1Vac7ArSqBT2QtwNcY8OEwmIkajgVCt3c/5Ne1s1faxFV4l6znBUyrmb7UBL006nQdY0+hryEUsKCWwBaAv09F6FyVVFSRfmU5gE3xEt7QnbMsz1pofT0qAPoGMqO8taJUjRAW9rGFzdydW5gefFzFWFHh5KYrnIUPbMwuG0e+CIDZpq/2O85EBYSEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57qkrvi18zOtC3l5ytiB4/5QhMTnhblAxz1YEGTGd5c=;
 b=BmJraAhhq1b3e+6r32xiEi2y1bLWxedHF5+CGhyIeLDIXVDs1Hcv6gz3zMcssMGdscjaXRf9JD6bJcMw+bv96wVTO+bOg3lr5aEwaYL8Okq4/WuGmtxyLEsboI8Lbi8mfFpILZcj6iDKSUoX/I2I3xYDi/5vA8WuvdItT9Tj/SexDqn0fzQ4+9tM0EW2AzJAuxnNLTrmfNnNbboDnjpne7oUivu2IDCD6cKuS6yYXyV6ppvJ0ZxpuXYNj1kEC6HnzBIyDn+eJQ4ci0xvF0nnzz01yn6VzLqP5lVrvt+Y0K+VgOhjEKSbNODSAyAT6va+POOU9hOQP8Ez6grxe9q4ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57qkrvi18zOtC3l5ytiB4/5QhMTnhblAxz1YEGTGd5c=;
 b=l6/Vr5Uiq364aRG14SipT1YnAddiOCDI/XN1eUVCF+zBJLq5WqzQvXC5U7Uoq0XWPNkqKE/Pxy261lgcRUM+BJLvu+87keRgg+hVf8orkNFwkBJUkiP5wSjTrhyC/K13Hk5RGdRqHHObvzdtn1ebedGE9s1H9XV31zm3Vu8J8/w=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB4617.eurprd08.prod.outlook.com (2603:10a6:10:75::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Fri, 8 May
 2020 09:01:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::87c:7c40:a1a0:26e0%7]) with mapi id 15.20.2958.034; Fri, 8 May 2020
 09:01:06 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
CC: nd <nd@arm.com>
Subject: Re: [meta-arm] [PATCH 0/4] Reduce autonomy-host image size
Thread-Topic: [meta-arm] [PATCH 0/4] Reduce autonomy-host image size
Thread-Index: AQHWJF/mZLCF75KJ0UWdlRaoQ0x84aid5aoA
Date: Fri, 8 May 2020 09:01:06 +0000
Message-ID: <C97922BC-11CA-430A-8A6E-5B14427C0B31@arm.com>
References: <160CBA68D3F3CE5E.1278@lists.yoctoproject.org>
In-Reply-To: <160CBA68D3F3CE5E.1278@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 460850a1-ae28-4452-22bc-08d7f32e5c3c
x-ms-traffictypediagnostic: DB7PR08MB4617:|AM6PR08MB3893:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3893F21189873C1D27A1B3BA9DA20@AM6PR08MB3893.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Cb9Fa8a9pkHGxChSP+ulAoiSkR9FH+1QxfJ3LtBWpO68eLRy6E1vC8tbb5mTINmNVmwyDfGvk/xvao4kc+oLh/Ab2ZwqKtkNta1YjYmCciH+0nN09Ll88ZzcMs3F9JC1Yte00TfhmQqo8QyJLi0WQ2CcJITFrxoI8KMCWj/L/GHkNsvaUZgJuqeLZ/6b5MIIGfp50+Bv+a7ZFFaxe1/cQ99MBMoy6/2NhQApvfQaa/BX+jypkSIoOuUAIadpIobicgT+//mFXAeY03KZNg3O+xPkUAW2oBhu5/asiPl13IcDVi6igWQCh/KT1DdjBQSwnhl6nf9Sk+zPQ5T4G7inqNlLytKEDRHeTQ/1q0HhV8tyjAT90AaPm4q7i4LrzDjmgFuNeZ0fM/giSVxS122//g1gNkMUICEPT9dsRNCaAW9e/JfKAD/zSM6vXwc+sX83i+EwXDQPXSICOrQilktuwgEYtPwUmfs+QP+4mUSlXc2jK8WYRXeGgADtIm+KgkUpXjsxbUE50v/plJGT+PUmkhfa7mfG4tQaf5VmqvDylasUtQ2MQgUO3Np+7/J+1WnNo18RU5CdIIto+nAlnn/X/m7w/Eig2fOjrLKg9iv+MZY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(33430700001)(91956017)(186003)(26005)(6506007)(53546011)(2616005)(2906002)(71200400001)(36756003)(83300400001)(316002)(6512007)(83310400001)(83320400001)(83290400001)(83280400001)(6486002)(966005)(33440700001)(8936002)(5660300002)(66446008)(6916009)(66946007)(86362001)(478600001)(4326008)(33656002)(66476007)(8676002)(64756008)(66556008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 bsJcaTini5dYyFGnCclLaxbNrXfb1es1l4bD/Y/x+zRiLxImk67eF4MYYOorDanygqQFfuVGNyyQHA5msqDKtIyP2fAxRDgYF5eFPUekfq7ju4gL7bAnZe/mPzSlxY2GBOWAOm03XXqMdujpaeVChMijZRua04BzI+hl2J8dVqYPQMdP9VfQknBe1z0mdJ41BR1OJArO7h/k51955DlWffUWEAap2KAWx/itLkMmPGwXAr5FuTseqADQwQRBMGL4r4NbGR4S2JuZe8i7rk1wI/C7rODADUe1wBwkiEkNI6fuqoSMSXfCv+nMY5tuOEc4pmrITMQQ2/SWapMkzXoH02VJX7Y+YSHFwMsIayJhXdOtiqlsSwGWlRFrUQF/jL7J5fPoppOx1M42zv2l4znlTLzhO+7FhXCzc3Fv3254lW+Ypj/qjh82sTfJrC7iz1bDNyGYkWUhGYL8DljPRWA+ABI950snWNelCWoQUy3Lu/k72AoLJQALZguqgbabOycp
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4617
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(33430700001)(82740400003)(53546011)(186003)(70586007)(81166007)(4326008)(26005)(86362001)(33656002)(966005)(2906002)(33440700001)(82310400002)(6512007)(70206006)(5660300002)(6916009)(47076004)(6506007)(6486002)(356005)(8936002)(316002)(2616005)(36756003)(478600001)(336012)(8676002)(36906005);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2f77b3a9-0fb1-4a97-a36e-08d7f32e582f
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FBLfWNHzeH7BVS70gJMqf+wDgZOZMjtv/u+IW8UUkvXrqszl2uPFeQw3mTKet4mcQmmMhsZK6k8IuHf1JzG3dHw+pvpxzOdmcXV0acZG15+4kS7wvHwJuXDj7WgzboWRcTgmGIlY5Xs7y+QaPZ0Yd/ii3D9JAxPB3MTSKidOLUI5lb7ZiB06Ta6M+lW5p3CIzD9MM21OUPGw2uVcC13wmX5o9C2QscWoPcu2uf/WYNJboCR3l5FbfpNsp8dUJFj6APghRumZsNZwWjsFAF0J/IKULxrIazbdL9OfMj4oZnteXBVSCYk+EzIAQwhljwkuSzDZ2cTY4ZodfZokZBlDf0wPkWv7LVBd4JRI2zBS2ftwwJW/3LAx/7huBGwEaw8b6z3hBU3oTfuS9+tzuLnWUOV1+aAHzbcou6jeprpzGv7UYLgfyASyaoiBaAjadt/hbyJ154TNIq1IA9RB3QbSW1EQ17uz1FJ78y0uu+VriQ5Ardr1uhnrAT1WLw627ELFnDzZeoqAeb/DHzGz+dYaWkZt9ewUoJz8rK45+UMvdLi9jPxtE6Z79Q+rDUa3vkXu/uAUBksTL2TKKcPCqxZV4XgNUuk0J4XUTdVoo24cKBz2/zz7+1tDctHxwsWTU4tbXMC/E+1x8C6lz89r6JAxuA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 09:01:13.6045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 460850a1-ae28-4452-22bc-08d7f32e5c3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3893
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <290E87ED623EB841B0010D4038B01E37@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 7 May 2020, at 12:08, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This patch serie is doing several changes to reduce the image size
> produced when autonomy-host-image-minimal is generated:
> - only include qemu parts required for xen
> - remove kernel binary and modules from generated image
> - optimize qemu compilation to reduce the binary size
>=20
> This is generating an image of around 120MB instead of 700MB.
>=20
> Diego Sueiro (4):
>  [arm-autonomy] qemu: Split qemu into qemu and qemu-xen packages
>  [arm-autonomy] Don't include kernels in arm-autonomy-host images
>  [arm-autonomy] qemu: Don't build with audio support when Xen is
>    present
>  [arm-autonomy] arm-autonomy-host-image-minimal: Remove kernel-modules
>=20
> meta-arm-autonomy/README.md                    |  1 +
> .../conf/distro/include/arm-autonomy-host.inc  |  4 ++++
> .../images/arm-autonomy-host-image-minimal.bb  |  8 ++++----
> .../recipes-devtools/qemu/qemu_%.bbappend      | 18 ++++++++++++++++++
> 4 files changed, 27 insertions(+), 4 deletions(-)
> create mode 100644 meta-arm-autonomy/recipes-devtools/qemu/qemu_%.bbappe=
nd

For the series:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

>=20
> --=20
> 2.17.1
>=20
>=20

