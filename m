Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC27EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 14:17:07 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.59])
 by mx.groups.io with SMTP id smtpd.web10.14162.1686665819927503687
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 13 Jun 2023 07:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UFoRUnia;
 spf=pass (domain: arm.com, ip: 40.107.8.59, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvE16UR1G3S3WYKc14qktRIcL7qR3oAgbmPtXw3UGlY=;
 b=UFoRUniaDD6bAKDfAkeZ3/Cgxg9t7PYqQcrrnxww7Xb951tw0+i2Dz8VxdsB1PUkkJMXLmwdhoKLPoGNhq3VrJW6w/EtBD39AGuIsr6bUPne6RWMM+s/+s6I8QeN1raoKiXPW+1E5LCFNYYHJ/o0N4IaVoumw+Z00QiaAtS7A4o=
Received: from AM5PR0301CA0024.eurprd03.prod.outlook.com
 (2603:10a6:206:14::37) by AS4PR08MB7783.eurprd08.prod.outlook.com
 (2603:10a6:20b:517::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 14:16:55 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::28) by AM5PR0301CA0024.outlook.office365.com
 (2603:10a6:206:14::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.35 via Frontend
 Transport; Tue, 13 Jun 2023 14:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Tue, 13 Jun 2023 14:16:55 +0000
Received: ("Tessian outbound 3570909035da:v136"); Tue, 13 Jun 2023 14:16:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 525032182c81aefd
X-CR-MTA-TID: 64aa7808
Received: from 0bc864d9d8b0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AB1465AF-613A-4372-8872-E61CC340FE48.1;
	Tue, 13 Jun 2023 14:16:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0bc864d9d8b0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Jun 2023 14:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr6268WCr6vP2mcZH8ZwqtCq35sBhVgIyxQiFgal3qQYH7YMTnzMyfUrmCH+TFqy2xrQJ9Sc19dIjYy4CDbQiLNuZOujjmMZeEtMsit06UTaRb4qUN0o45fquZt+1uxa75C93RCqJecZ2u80Q9bE1zJKljR1dAjfbf+zpRp5VZ06i2Mf4O0OXZ8Yhk7/WnPG7dPi7g5h6KM7UYfrQquwzqZ5EONP+28/OVaMhanmykYUc/bMWeY6jT4kA+Td2OpY9/6iqsdDsWkCZ2zfgzsmsOZ02ybdYQcxSVlLezeEeqfAtFXzf8KTx8HVyRaM1MTgQbKRj8cOj4hSDh/7KtDhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvE16UR1G3S3WYKc14qktRIcL7qR3oAgbmPtXw3UGlY=;
 b=DmvwpoFcwweE7j+BfKb9L8rRW20orpuC/GnI/9qRfcomJLe/mEAGaEIy564WzqcAgCG/0mCTxBIJGXO5IMITLAZ/xdDSF2sHFQbQO6TqmHUg3WZ8a/3HAtuyOEwadLkWLYXTezY+Er1hbHskrHmscTGHzs/VziCzCjxPFkPrgzXuNfHMdhRfq+4fmc7XiEBoD7Ur9cdEr7AEWW7MfovywvO8XzW6sxcie58j8UQM5q8gvQM9XO06L5G/miQGJEVtZ/NZiO/wzOcs77JT4YztWHlcCvil4C2Js0v63tVz4i6xRAvqjxbkvYVV5Kh5iedF454+oOSVaLwbj/NjBHJPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvE16UR1G3S3WYKc14qktRIcL7qR3oAgbmPtXw3UGlY=;
 b=UFoRUniaDD6bAKDfAkeZ3/Cgxg9t7PYqQcrrnxww7Xb951tw0+i2Dz8VxdsB1PUkkJMXLmwdhoKLPoGNhq3VrJW6w/EtBD39AGuIsr6bUPne6RWMM+s/+s6I8QeN1raoKiXPW+1E5LCFNYYHJ/o0N4IaVoumw+Z00QiaAtS7A4o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7923.eurprd08.prod.outlook.com (2603:10a6:10:3ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 14:16:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 14:16:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, nd
	<nd@arm.com>
Subject: Re: [meta-arm] [PATCH 3/4] arm-toolchain/external-arm: remove
 -fcanon-prefix-map from DEBUG_PREFIX_MAP
Thread-Topic: [meta-arm] [PATCH 3/4] arm-toolchain/external-arm: remove
 -fcanon-prefix-map from DEBUG_PREFIX_MAP
Thread-Index: AQHZnbVVup+XR5pYSEyyzFjRFbzpE6+Ix+gA
Date: Tue, 13 Jun 2023 14:16:46 +0000
Message-ID: <C5FDDC93-624C-453E-9C80-96E66E806C91@arm.com>
References: <20230612145659.934478-1-ross.burton@arm.com>
 <20230612145659.934478-3-ross.burton@arm.com>
 <CAFA6WYMfzst+gsYAYKumKVU1zrVxpKL04w_P0+mzoQYC2FR_TQ@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYMfzst+gsYAYKumKVU1zrVxpKL04w_P0+mzoQYC2FR_TQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7923:EE_|AM7EUR03FT016:EE_|AS4PR08MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad4a5d0-34f6-49b9-6792-08db6c18d79e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ei++x7q0QC33UjwvN1Af9erxE4+bXwLehzOsMXxCpPt14T9Ffy3w7hIrik/2VHowCFaE7yXkykVPRFkXGitChB8KQIMRzf7cb5PntY1pVLZSetowjtU7dWTpeOwkOle9FLqwnp8+WWlDhnnfqCXFPq9E+76FY8YFFa2smgO4C4cmw2BHu0JWDv/xpCjo/8RRAXWDKpMVUbZypC55o2ZA9q2NJDID1QwWbNJaVqMo5K6LUks6piH53fUmHPH00R7eMPiOmiLyJdXOCGhJtccdGs4J0mH+musVWO/T0XPIaLW5sPG2Y+cEkpPHomVx6PAijaYmyZQF4QSUEawM/KvSPF1yPB1kreeqtJznsj0+fZNiRZ7j8CjHEEvxl2ALcervkRBfn+IPhMg3gkCvsy1zGb0wJ3NPGPLaHXnd3tPxLhfp7AJUDKed3Ti/VufRGgOKP5Wuf+7vKmwhtZy3l/j5kP0R7yubt+hvwbUpPFLKU44gzZg8Mq0aNwSrxPc+qT2aICIhmY9O76Lm5GDTorsoemQnGLx6lD2/hJCJnz7TMd3hAxB2tYZMq9hYnurfK6+xO3jbEFpaRzL9m9wg7MWSoa18tCKIlwZvqQHY5fgPOaqFg9Dwa4OjCLDZXMGX0Ny3BO1bhToewKw4Codh80p/tg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(54906003)(6916009)(66946007)(76116006)(4326008)(91956017)(66476007)(66446008)(64756008)(66556008)(36756003)(186003)(478600001)(2616005)(4744005)(2906002)(8676002)(316002)(41300700001)(86362001)(6486002)(6506007)(53546011)(33656002)(38070700005)(71200400001)(122000001)(8936002)(26005)(5660300002)(38100700002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <448C4D470F0FED45B5A6F8CF2F89ED3D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7923
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a874a4c2-0ae6-4967-a342-08db6c18d250
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L5rKodlwyo4wnO2aEVwSAfJwiVoTyKuSbp467nEK+yaD/X36sxzwEg4+JFcadN0CKDYJMHn4bCEY5PMdJTCArVksKAKmZPmKlkTnzbsfx+K7Fg/TNNh9ay+L9npdoD3N4GOo98n7Pe4VeCKtjdzUaCRHFjo8+7il+ujYpuadw+yf4o9wkacozJ0bSECdhQalKex6wo8vSyAtEN9KfqjM4tCaNlon63GRAM6/o86HzkzX4B2EPl371ZAJwLPAn2Wq+wihDaezyijo4YCvhETTCIk7urdJDre6k1HfXf4UymYquxAIQfmwT/JalhgDRRiLHM1taxOGNfepWpHbh3zwjNXMdJZ4HfhliAgvmy/odjHJd/BOP24MKp1eed8gTZOzrcFwYd5K8sFUCT4dwNXCIeFShl7YzAgk4eCbIGy+KUF+BDkcElv4NKs87YqhsCnVL98uGlYC/hRHb3RCeeKtZu7U1W8AUHTBZACduqZtR9EA5/XOYYH7/K3tLov3+ikaY6KSdj62gEVwBgVsrGyqQmka0nLsV1fKTirvwz4ptXL/uzrNafcgUPXdoB3XfaLNn+/Vcl9Ii9UF8QGIDmojKxc82mn4GlvfsfhqEukyimfjKSBZjKrEMbDgzs4CUWk88ASUEXUEGzz2mbL30mTB0ZNgpxqwGIeWHoqZ/9tRpl17bszuFTfXul4LzOYFGHZc3dLOD9ESdmqqfWKLt9jm84pdLRrZYDEAlxnFCa/QNtyCj2zD37ER0o8H5f543JEP
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(70586007)(70206006)(316002)(478600001)(54906003)(4326008)(36756003)(33656002)(86362001)(36860700001)(53546011)(6512007)(6506007)(336012)(26005)(186003)(47076005)(5660300002)(41300700001)(8676002)(6862004)(8936002)(82310400005)(2906002)(4744005)(6486002)(40480700001)(356005)(2616005)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 14:16:55.4929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad4a5d0-34f6-49b9-6792-08db6c18d79e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7783
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 13 Jun 2023 14:17:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4769

On 13 Jun 2023, at 06:10, Sumit Garg <sumit.garg@linaro.org> wrote:
>=20
> On Mon, 12 Jun 2023 at 20:27, Ross Burton <ross.burton@arm.com> wrote:
>>=20
>> From: Ross Burton <ross.burton@arm.com>
>>=20
>> The binaryh Arm compiler is based on GCC 12. Remove this GCC 13-specific
>> option until the next release.
>>=20
>=20
> We have to keep this GCC 13 flag removed by default since we support
> multiple versions of Arm binary toolchain GCC 8 onwards.

8?  <shudder>

Who supports this, where is this documented, and more importantly who wants=
 an ancient gcc?

Ross=

