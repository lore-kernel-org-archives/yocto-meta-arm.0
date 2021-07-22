Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.71])
 by mx.groups.io with SMTP id smtpd.web11.5196.1626942716168147765
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 01:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=irAlQqbz;
 spf=pass (domain: arm.com, ip: 40.107.8.71, mailfrom: arunachalam.ganapathy@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DVNI0jAMluqfUV26ykbHtou+SMTBXz9AtjL37Jveds=;
 b=irAlQqbzPi/sOdH+AAV6GKjjrYOaNCNR06Ey4m1a7LIgGicQ+v9ewlXV1kNy8P7jRQjrdXGJv6W539hWthWJeNVflmdKaExQiSxef8ZZ3uqxSP5SzQsjAbI0dFrm8p01Oewrk8lEQ2Q6d6MScC5VX/Dj/n576clMDWWiYq3gD0g=
Received: from AM6P195CA0054.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::31)
 by VI1PR08MB2861.eurprd08.prod.outlook.com (2603:10a6:802:19::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Thu, 22 Jul
 2021 08:31:51 +0000
Received: from AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::13) by AM6P195CA0054.outlook.office365.com
 (2603:10a6:209:87::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Thu, 22 Jul 2021 08:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT017.mail.protection.outlook.com (10.152.16.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 08:31:51 +0000
Received: ("Tessian outbound 664b93226e0b:v99"); Thu, 22 Jul 2021 08:31:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbd387b4128758df
X-CR-MTA-TID: 64aa7808
Received: from e8e607948237.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E0765EC9-9E36-43F3-8084-1240DF12A374.1;
	Thu, 22 Jul 2021 08:31:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8e607948237.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 22 Jul 2021 08:31:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv23tE2Q0C1ZebUpJxRL9Q6bVUINLZ52hGarTSdK7e4R8b3HeOeoFSMrm3Kh6Hyr/XYn0z1p+w9NGB0I5jkWB46746PKDj74NDkb8ZmkwDLjCX332/CRpm1UVkmFG+cneqBnE2sf16UVXLln1eX0IVbYHfs8gtp1Q7p20xcfa3KkqxqSVUFwGb1UCIBbd8+9p303SaYr3RqMTolmj27HEtyLr7qTtsGdExh9cJjAVkRpQwjOXHAReZd/lPpGQd7Xkh+TdPkqqDqFFJ0MAXOz0TgqiHSX5W24ZXE55CtIgKJienSgOfqIBrYZrLIw/p6U+2CfIKwulA7C40+NW+6o8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DVNI0jAMluqfUV26ykbHtou+SMTBXz9AtjL37Jveds=;
 b=N/pUWkdnUxu7QUYKQEOcGG0H+Dr9+vHqMIRHkI7pWQ77KZIvH6m0do8kLAdzZA0FcTeo13SuqYt5Z3HG8Rj4y6thdbLZ3lAZvaS//5NFRaBOa8rtgtQQ8h/TqV8vkQrH+LC0DqoDerYnZx4LsSdUJuQcFK43wPaw5zlDQQLpMmkfWpQ0SLV1vHhLaR56urOzVbuE1G/vhhVrL8mpn55tOFSsne8EgOU/ehKpW+gEVjNH29EZ4n7uonY9molq0q3tatRWWbsA47bVi/5SD45ZM8gn6ykvPyN2E1XTkYLZPdlWUxA8Dd85q//Xw8WzPwwC77k3GqpOUF9e42p0uFhC9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DVNI0jAMluqfUV26ykbHtou+SMTBXz9AtjL37Jveds=;
 b=irAlQqbzPi/sOdH+AAV6GKjjrYOaNCNR06Ey4m1a7LIgGicQ+v9ewlXV1kNy8P7jRQjrdXGJv6W539hWthWJeNVflmdKaExQiSxef8ZZ3uqxSP5SzQsjAbI0dFrm8p01Oewrk8lEQ2Q6d6MScC5VX/Dj/n576clMDWWiYq3gD0g=
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com (2603:10a6:102:136::18)
 by PAXPR08MB6654.eurprd08.prod.outlook.com (2603:10a6:102:15e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Thu, 22 Jul
 2021 08:31:33 +0000
Received: from PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34]) by PAXPR08MB6766.eurprd08.prod.outlook.com
 ([fe80::b4c4:746b:9a5e:2a34%7]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 08:31:33 +0000
From: "Arunachalam Ganapathy" <arunachalam.ganapathy@arm.com>
To: Sumit Garg <sumit.garg@linaro.org>, Jon Mason <jdmason@kudzu.us>
CC: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>, Jon
 Mason <Jon.Mason@arm.com>, Ross Burton <Ross.Burton@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: version uplift 3.11.0 -> 3.14.0
Thread-Topic: [meta-arm] [PATCH] arm/optee: version uplift 3.11.0 -> 3.14.0
Thread-Index: AQHXfU8sHi/7BYITIECBU8BjNsfP9qtL8FiAgAK0UoCAAAVDAw==
Date: Thu, 22 Jul 2021 08:31:33 +0000
Message-ID: 
 <PAXPR08MB67664F0DADAC5672C7FA6C4CFBE49@PAXPR08MB6766.eurprd08.prod.outlook.com>
References: <20210720100701.881614-1-sumit.garg@linaro.org>
 <20210720144236.GB16077@kudzu.us>,<CAFA6WYO4qmV2UgM5JiKPX+3rvpyGnWkRz7qpVq9HkS6Bjo3BgQ@mail.gmail.com>
In-Reply-To: 
 <CAFA6WYO4qmV2UgM5JiKPX+3rvpyGnWkRz7qpVq9HkS6Bjo3BgQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0e0e6122-cab6-4d68-20a2-08d94ceb27a1
x-ms-traffictypediagnostic: PAXPR08MB6654:|VI1PR08MB2861:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB286131C9120A06CECE6C22EFFBE49@VI1PR08MB2861.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dQNOi0HdymWB8kUug5iexnnb9YNLiTzODAEufpuux2ocT/afAvgZ3wH565w11Y3l0PeNEIYhux5/o3VCwhztuqwDUSZ59DfwdSTLFjXUJGlHIvbxIxxhWSDJZJycYoJWqPBxvx0hqYAZjLJWkiRKn0Dr39r6om9cCTj3bxZXluoGCkx0cWzSo2CV2Ml8iGML1FyI6+obDYQZ6y/lm6mSZ4+RLM6+VkcHvAUR1Qf8pxCgRRfY8qGaQbKjYmxTxfdpfo5BETu74LWqH6lTfxvvo1n5ga+Ff8kJq/V6358xM7iJP3WKVKQ7hbRYN1dmpf6oQ4nzQ3LD1eTrthLsMfZYFQVtKNqNtKV1LLYPFHEOU3x4eKaofwhsmhKPccbM0khUbW/j8/T2NxgMFeBYVcBQ4X6ZfjTsPDOSNI0sqWe+f+VbhDa4NzhCG6ByFIY3WsYWwOCRGHOTcBVIS+N2jlYBvAAXJHnDkPdkdaPp1d8l4sIM5w/SsFvm1WRc/9wJzjR210csOVUNqzxDH1HIOkFycuy0pI6sKSf5QryR8YQ/s4QXONsRMh3aI7AT0xtn0CjYNF2PQXwk0/f6CMS8u2uu9TnXtO5rNTeB7aRziuNqSgzxCCyLBknIjmclOT2QbIL/znlgjKypSU7tbsHp0jl7qH1fWgDMvzQYeRnbWmKtm2H+yJuSwLgKjQv1ZR+5qF5YnaLvvL+LCql+NopUNqqpVRUJpNbTDoL5IdtyXSIIomoy0KZU2orZ6urMohtWOotw0ge0fAA7tAEp6AoM5owSaIdzQGoWz+Qpe9ipkcJBRzaOSaqx2MV3GiFW2aA9kQaNyqQI6f7O7mDpfUVNbjbgLg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6766.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(30864003)(38100700002)(26005)(52536014)(2906002)(64756008)(66476007)(122000001)(71200400001)(86362001)(316002)(5660300002)(8676002)(66946007)(110136005)(8936002)(91956017)(76116006)(66446008)(53546011)(6506007)(66556008)(966005)(4326008)(186003)(55016002)(83380400001)(33656002)(54906003)(7696005)(478600001)(9686003)(38070700004)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?aECyX08p0abD5xM08aIZCLn2WUWV26E/SGhqljsjgawVuQX7IiIOe7Crt9?=
 =?iso-8859-1?Q?kz/76N1phFNmtM3glB8bo+YNoXS2YkgEPtXm/JfpXY3DOZ4ZukKPIIzG2V?=
 =?iso-8859-1?Q?FQRvJdYYleyBcqpOQStnvA1fiFC4BJCnnuAATFk2o7YJ6bgiokRJMmqSr0?=
 =?iso-8859-1?Q?PmpDl58TaAZpo73yGrdEeY+L5CXUI5Y7D+zrAY5XohlY+fFPQP0iLSdXoI?=
 =?iso-8859-1?Q?R653WwNvmjdEa9ZssuPo2WtKb9r3tYUlczPg/v4IdbE/JuSh5peoxHnCdT?=
 =?iso-8859-1?Q?aQkhxQ5vv6yWlvveLjCUy+nMhdDW9lyNWcG/DtgsXd+GJGzbJ/oYb2HbEs?=
 =?iso-8859-1?Q?gjqGF2w2QXQsNiUywz85qAEfw9X9oUoHXhbb9FOfrlCyBLddubt2A6tsdg?=
 =?iso-8859-1?Q?z0VRqPPLtV4sXPf9Cl6lG/nulKyYs3vftKgDQPWJnELbXat5NfqnuoU9ME?=
 =?iso-8859-1?Q?Ntwmy1Nxiu2l66Vg6J0mVnJmvR1jM4WNX8K+a8EVVP5PUFO89cC6xuUpho?=
 =?iso-8859-1?Q?5yLqpkR0huF89Reg+XPWCED7qKVX30fNiJnHXGxvlDGlRqiCu8SsvDYgKZ?=
 =?iso-8859-1?Q?+8oZ2782rnTE9pttda+tfNpsk1FNeR7923MncLrPgdH5DHxDefjKAOH5VL?=
 =?iso-8859-1?Q?dBRFHIMpSqTVGpQC9A/LpGb6biEMmgRDOl8n6h7A5wzT6SObdKeAdNwtuP?=
 =?iso-8859-1?Q?JvUmvKBnF3a/mMXPxUd0gMnkJ0LWVqbv/8bODH+HvMYhFqi1IW1cwi+8G0?=
 =?iso-8859-1?Q?a/QaKNxij7SiblZGthGnYvPJWCb3gUEXe7xeVhmSDPurAOsm8wopXLv2Gc?=
 =?iso-8859-1?Q?rg7NIkOqpbsskst0AwdV/GyXSGtHG7+TQvvGMxr8o5eKLNy9Nc5UXv3oNi?=
 =?iso-8859-1?Q?NT4TEIBpRPH2oV0iJtcHpas4C99urOXkSDlYUYCEQ4ikSJ2aYq326apySy?=
 =?iso-8859-1?Q?2FshycHfH+R97CpgqxgvtNJTVu/koKe19dlJgI6Rlzjkw9naBjnvCW/Lte?=
 =?iso-8859-1?Q?0HzVwq2YOLyevXUzHEUClh+Btaz6B6qp6Rrml6wALBlFi30GlwMDTsqI05?=
 =?iso-8859-1?Q?c12vLtme2a7aIMhNJPQzPb5vO8gl5kSbFfMnrk+O7hpUIgXY+fZWa5IQKq?=
 =?iso-8859-1?Q?GGH+mC46+xPil68s4JvwDemASP69infvZyPsI/jVrBP0mUxl83liCR3Qet?=
 =?iso-8859-1?Q?Ph+H1hpnohoQCc0ExqyFfcJ7mNllGzVsR5nB7AHGpJ+naCaQA5PgpkMzr5?=
 =?iso-8859-1?Q?TOPSOur1MshMzcxtSvft1rFwSC88QEQuIyIDKAYPy+PRj9DdM6jvVhqCRr?=
 =?iso-8859-1?Q?6T95XMemZSw0+vaj2+VIURkQFiRssTd4hLWW0srG8IH7IHw=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6654
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Return-Path: Arunachalam.Ganapathy@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5a0c9625-b764-4896-835e-08d94ceb1d07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VvG1IDr88EU8UjviqUJgSjELweMdCjyzB7T0oHa5pWVOO4QzgR/5Oao9V1J+99bczLqZ8XIO/6o+s6E7+BGzcAAqQQKc0XIyGnEvj6W/ILe3g2xRZwhRHk3biNrgQudj6LWo01gbs4nCNEiZ74D968S0T2XnVeu7zLpgWNLoSnQ4OMT3BKI+qAy5uc4dVi7v538NCpEvZJNp+tKXu3EoB4H7wUILXlPuiMCer3YfZqDWJPKOWPtVtu50LuDCRLL/m0LB0WqLq6LFS76ch7V978lXAGOodbmvjIq+E2MNnIhUTz3vrm5nVfvL5o6dvnNVZA+XFsI/ErphMEc9x2867WA/S+2Twfu/0H7eAyX85rghTBcG51bjvSIe/QGCuLxuVR1fDiTKI659k0Dq4GqjnrExvXA4+1pqbo4J0/eSRhvS4Ov0ES9xteh5sIDykvv4e2VhvMazz1wgb9aJG++ZGPHdND/xVrP2u0ElbZOg6K8LIs6wjEB2FKF3pIZQH4qp0twWr4JXtzdHHyeScN/qm3UuI2tvxx1Yu9sJpcsr31mJroESr24fHx68ZBxw3zwqvoWERZLK83Qwc/UJK5K5gC2Yn6JbPsVw8rt+8YA4NNnRcRYOkGfzMV7pIdAyHn/mJ2M0Pujofm/lvvXINQScZYqROrlsFvr/84RGQxYjYEoZ4BUvIiRopBQ7dEKO04AX7xDyEWIp1mJl8qKaZPuIBm25oTsJosP1fACr6hjoJTfeBJMU0KXAMXAqrkm4IANNzOMn9xBcHEGRPrNPB3QAXhyT7w/npA/WVySprFpiHmQaof0I+inmAZ51n+/3Ru5hx8Hl/RAbIkpIWoNGGMC12A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(8676002)(356005)(82310400003)(55016002)(81166007)(478600001)(36860700001)(2906002)(70586007)(47076005)(70206006)(7696005)(52536014)(86362001)(110136005)(54906003)(82740400003)(316002)(5660300002)(4326008)(966005)(6506007)(33656002)(26005)(30864003)(186003)(83380400001)(8936002)(336012)(53546011)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 08:31:51.4743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0e6122-cab6-4d68-20a2-08d94ceb27a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2861
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Sumit,

Thanks for the arm/optee upgrade to 3.14.0. I have used that base recipes =
and upgraded optee to 3.14.0 for TC0 platform and it works fine. The patche=
s for TC0 OP-TEE upgrade are in internal review.

Jon / Ross,

Post internal review, I will send out the patches to mailing list, can you=
 please merge arm/optee upgrade and TC0 OP-TEE upgrade together.

Thanks,
Arun

-----Original Message-----
From: Sumit Garg <sumit.garg@linaro.org>
Sent: Thursday, July 22, 2021 09:00
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org <meta-arm@lists.yoctoproject.org>; Jon=
 Mason <Jon.Mason@arm.com>; Ross Burton <Ross.Burton@arm.com>; Arunachalam =
Ganapathy <Arunachalam.Ganapathy@arm.com>
Subject: Re: [meta-arm] [PATCH] arm/optee: version uplift 3.11.0 -> 3.14.0=
=
=20
=A0
+ TC0 platform maintainer in OP-TEE

Hi Jon,

On Tue, 20 Jul 2021 at 20:12, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Tue, Jul 20, 2021 at 03:37:01PM +0530, Sumit Garg wrote:
> > Brief description of changes:
> > - Version uplift 3.11.0 -> 3.14.0.
> > - Removed OP-TEE patches that has already been accepted upstream.
> > - Added support for tee-supplicant plugin framework testing.
> >
> > Tested on qemuarm64_secureboot:
> > $ xtest -l 15
> > $ optee-examples_*
>
>
> Unfortunately, TC0 is using the 3.11 version.=A0 So, it breaks when
> applying this patch.

The TC0 platform support was recently merged in OP-TEE upstream [1].
So I took the liberty to migrate corresponding recipes as well [2]
which is build tested only as I don't possess access to the platform
itself.

[1] https://github.com/OP-TEE/optee_os/pull/4736
[2] https://lists.yoctoproject.org/g/meta-arm/message/2091

> Can you rework this patch to keep the old
> version around?
>

With TC0 support for 3.14.0, I think we should be able to drop support
for the old version.

-Sumit

> Thanks,
> Jon
>
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >=A0 .../optee/optee-client_3.11.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0 3 -
> >=A0 .../optee/optee-client_3.14.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 |=A0=A0 3 +
> >=A0 .../recipes-security/optee/optee-examples.inc |=A0=A0 9 +-
> >=A0 .../0001-make-Pass-ldflags-during-link.patch=A0 | 103 -------------=
-----
> >=A0 ...efault-cross-compiler-environment-se.patch |=A0 84 +++++++++++++=
+
> >=A0 ...nable-plugins-installation-in-rootfs.patch |=A0 39 +++++++
> >=A0 .../optee/optee-examples_3.11.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0=A0 4 -
> >=A0 .../optee/optee-examples_3.14.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0=A0 4 +
> >=A0 ...ide-empty-__getauxval-implementation.patch |=A0 62 -----------
> >=A0 ...t-support-for-libnames-after-libgcc-.patch |=A0 55 ----------
> >=A0 ...ke-sure-that-libutils-is-linked-seco.patch |=A0 44 --------
> >=A0 .../recipes-security/optee/optee-os_3.11.0.bb |=A0 11 --
> >=A0 .../recipes-security/optee/optee-os_3.14.0.bb |=A0=A0 8 ++
> >=A0 .../recipes-security/optee/optee-test.inc=A0=A0=A0=A0 |=A0 15 +--
> >=A0 ...Adjust-order-of-including-compiler.h.patch |=A0 64 -----------
> >=A0 ...ake-remove-Wno-unsafe-loop-for-clang.patch |=A0 31 ------
> >=A0 ...e-remove-Wmissing-noreturn-for-clang.patch |=A0 31 ------
> >=A0 .../optee/optee-test_3.11.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 3 -
> >=A0 .../optee/optee-test_3.14.0.bb=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0 3 +
> >=A0 19 files changed, 154 insertions(+), 422 deletions(-)
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.1=
1.0.bb
> >=A0 create mode 100644 meta-arm/recipes-security/optee/optee-client_3.1=
4.0.bb
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-examples/0=
001-make-Pass-ldflags-during-link.patch
> >=A0 create mode 100644 meta-arm/recipes-security/optee/optee-examples/0=
001-plugins-Honour-default-cross-compiler-environment-se.patch
> >=A0 create mode 100644 meta-arm/recipes-security/optee/optee-examples/0=
002-Makefile-Enable-plugins-installation-in-rootfs.patch
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-examples_3=
.11.0.bb
> >=A0 create mode 100644 meta-arm/recipes-security/optee/optee-examples_3=
.14.0.bb
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0001-li=
butils-provide-empty-__getauxval-implementation.patch
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0002-li=
nk.mk-implement-support-for-libnames-after-libgcc-.patch
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-os/0003-ta=
_dev_kit.mk-make-sure-that-libutils-is-linked-seco.patch
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-os_3.11.0.=
bb
> >=A0 create mode 100644 meta-arm/recipes-security/optee/optee-os_3.14.0.=
bb
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0001-=
host-xtest-Adjust-order-of-including-compiler.h.patch
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0002-=
make-remove-Wno-unsafe-loop-for-clang.patch
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-test/0003-=
make-remove-Wmissing-noreturn-for-clang.patch
> >=A0 delete mode 100644 meta-arm/recipes-security/optee/optee-test_3.11.=
0.bb
> >=A0 create mode 100644 meta-arm/recipes-security/optee/optee-test_3.14.=
0.bb
> >
> > diff --git a/meta-arm/recipes-security/optee/optee-client_3.11.0.bb b/=
meta-arm/recipes-security/optee/optee-client_3.11.0.bb
> > deleted file mode 100644
> > index f765d12..0000000
> > --- a/meta-arm/recipes-security/optee/optee-client_3.11.0.bb
> > +++ /dev/null
> > @@ -1,3 +0,0 @@
> > -require optee-client.inc
> > -
> > -SRCREV =3D "c0c925384c1d7e3558d27d2708857482952d7907"
> > diff --git a/meta-arm/recipes-security/optee/optee-client_3.14.0.bb b/=
meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > new file mode 100644
> > index 0000000..be78b88
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-client_3.14.0.bb
> > @@ -0,0 +1,3 @@
> > +require optee-client.inc
> > +
> > +SRCREV =3D "06e1b32f6a7028e039c625b07cfc25fda0c17d53"
> > diff --git a/meta-arm/recipes-security/optee/optee-examples.inc b/meta=
-arm/recipes-security/optee/optee-examples.inc
> > index 81c31bc..f2e53f3 100644
> > --- a/meta-arm/recipes-security/optee/optee-examples.inc
> > +++ b/meta-arm/recipes-security/optee/optee-examples.inc
> > @@ -12,7 +12,8 @@ inherit python3native
> >=A0 require optee.inc
> >
> >=A0 SRC_URI =3D "git://github.com/linaro-swg/optee_examples.git \
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0001-make-Pass-ldflags-during-l=
ink.patch \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0001-plugins-Honour-default-cro=
ss-compiler-environment-se.patch \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0002-Makefile-Enable-plugins-in=
stallation-in-rootfs.patch \
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >
> >=A0 EXTRA_OEMAKE +=3D "TA_DEV_KIT_DIR=3D${TA_DEV_KIT_DIR} \
> > @@ -32,11 +33,15 @@ do_compile[cleandirs] =3D "${B}"
> >=A0 do_install () {
> >=A0=A0=A0=A0=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz
> >=A0=A0=A0=A0=A0 mkdir -p ${D}${bindir}
> > +=A0=A0=A0 mkdir -p ${D}${libdir}/tee-supplicant/plugins
> >=A0=A0=A0=A0=A0 install -D -p -m0755 ${B}/ca/* ${D}${bindir}
> >=A0=A0=A0=A0=A0 install -D -p -m0444 ${B}/ta/* ${D}${nonarch_base_libdi=
r}/optee_armtz
> > +=A0=A0=A0 install -D -p -m0444 ${B}/plugins/* ${D}${libdir}/tee-suppl=
icant/plugins
> >=A0 }
> >
> > -FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
> > +FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/ \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ${libdir}/tee-supplican=
t/plugins/ \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >
> >=A0 # Imports machine specific configs from staging to build
> >=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-make-=
Pass-ldflags-during-link.patch b/meta-arm/recipes-security/optee/optee-exam=
ples/0001-make-Pass-ldflags-during-link.patch
> > deleted file mode 100644
> > index 84202ef..0000000
> > --- a/meta-arm/recipes-security/optee/optee-examples/0001-make-Pass-ld=
flags-during-link.patch
> > +++ /dev/null
> > @@ -1,103 +0,0 @@
> > -From 29ae21de41f2fbab6dbecbbf408826b28de82df1 Mon Sep 17 00:00:00 200=
1
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Tue, 1 Sep 2020 21:09:56 -0700
> > -Subject: [PATCH] make: Pass ldflags during link
> > -
> > -OpenEmbeeded needs to pass essential linker flags to set correct flag=
s
> > -for gnu_hash among others which sets the linking straight
> > -using LDFLAGS varible here means, we can affect the linker flags
> > -from build environment
> > -
> > -Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examp=
les/pull/85]
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - acipher/host/Makefile=A0=A0=A0=A0=A0=A0=A0 | 2 +-
> > - aes/host/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-
> > - hello_world/host/Makefile=A0=A0=A0 | 2 +-
> > - hotp/host/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-
> > - random/host/Makefile=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-
> > - secure_storage/host/Makefile | 2 +-
> > - 6 files changed, 6 insertions(+), 6 deletions(-)
> > -
> > -diff --git a/acipher/host/Makefile b/acipher/host/Makefile
> > -index 8f4bc8a..c2cabef 100644
> > ---- a/acipher/host/Makefile
> > -+++ b/acipher/host/Makefile
> > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_acipher
> > - all: $(BINARY)
> > -
> > - $(BINARY): $(OBJS)
> > --=A0=A0=A0 $(CC) -o $@ $< $(LDADD)
> > -+=A0=A0=A0 $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > -
> > - .PHONY: clean
> > - clean:
> > -diff --git a/aes/host/Makefile b/aes/host/Makefile
> > -index dfeb4e8..f61c71b 100644
> > ---- a/aes/host/Makefile
> > -+++ b/aes/host/Makefile
> > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_aes
> > - all: $(BINARY)
> > -
> > - $(BINARY): $(OBJS)
> > --=A0=A0=A0 $(CC) -o $@ $< $(LDADD)
> > -+=A0=A0=A0 $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > -
> > - .PHONY: clean
> > - clean:
> > -diff --git a/hello_world/host/Makefile b/hello_world/host/Makefile
> > -index c4c8239..69cf42c 100644
> > ---- a/hello_world/host/Makefile
> > -+++ b/hello_world/host/Makefile
> > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_hello_world
> > - all: $(BINARY)
> > -
> > - $(BINARY): $(OBJS)
> > --=A0=A0=A0 $(CC) -o $@ $< $(LDADD)
> > -+=A0=A0=A0 $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > -
> > - .PHONY: clean
> > - clean:
> > -diff --git a/hotp/host/Makefile b/hotp/host/Makefile
> > -index cb7fd19..e7f013f 100644
> > ---- a/hotp/host/Makefile
> > -+++ b/hotp/host/Makefile
> > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_hotp
> > - all: $(BINARY)
> > -
> > - $(BINARY): $(OBJS)
> > --=A0=A0=A0 $(CC) -o $@ $< $(LDADD)
> > -+=A0=A0=A0 $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > -
> > - .PHONY: clean
> > - clean:
> > -diff --git a/random/host/Makefile b/random/host/Makefile
> > -index fd407d9..9377f7a 100644
> > ---- a/random/host/Makefile
> > -+++ b/random/host/Makefile
> > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_random
> > - all: $(BINARY)
> > -
> > - $(BINARY): $(OBJS)
> > --=A0=A0=A0 $(CC) -o $@ $< $(LDADD)
> > -+=A0=A0=A0 $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > -
> > - .PHONY: clean
> > - clean:
> > -diff --git a/secure_storage/host/Makefile b/secure_storage/host/Makef=
ile
> > -index 29bfb87..b3265ae 100644
> > ---- a/secure_storage/host/Makefile
> > -+++ b/secure_storage/host/Makefile
> > -@@ -18,7 +18,7 @@ BINARY =3D optee_example_secure_storage
> > - all: $(BINARY)
> > -
> > - $(BINARY): $(OBJS)
> > --=A0=A0=A0 $(CC) -o $@ $< $(LDADD)
> > -+=A0=A0=A0 $(CC) -o $@ $< $(LDFLAGS) $(LDADD)
> > -
> > - .PHONY: clean
> > - clean:
> > ---
> > -2.28.0
> > -
> > diff --git a/meta-arm/recipes-security/optee/optee-examples/0001-plugi=
ns-Honour-default-cross-compiler-environment-se.patch b/meta-arm/recipes-se=
curity/optee/optee-examples/0001-plugins-Honour-default-cross-compiler-envi=
ronment-se.patch
> > new file mode 100644
> > index 0000000..033e48c
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-examples/0001-plugins-Hono=
ur-default-cross-compiler-environment-se.patch
> > @@ -0,0 +1,84 @@
> > +From 79c826c249001700007a6dffe80c3d61ff4428ef Mon Sep 17 00:00:00 200=
1
> > +From: Sumit Garg <sumit.garg@linaro.org>
> > +Date: Tue, 20 Jul 2021 13:54:30 +0530
> > +Subject: [PATCH 1/2] plugins: Honour default cross compiler environme=
nt setup
> > +
> > +Honour default $(CC), $(CFLAGS) and $(LDFLAGS) variables. Without thi=
s
> > +plugins example fails to build for OE/Yocto.
> > +
> > +Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examp=
les/pull/87]
> > +
> > +Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > +---
> > + plugins/Makefile=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +-
> > + plugins/host/Makefile=A0=A0 |=A0 2 +-
> > + plugins/syslog/Makefile | 16 ++++++++++++----
> > + 3 files changed, 14 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/plugins/Makefile b/plugins/Makefile
> > +index 2372b38..ea472b4 100644
> > +--- a/plugins/Makefile
> > ++++ b/plugins/Makefile
> > +@@ -8,7 +8,7 @@ TA_CROSS_COMPILE ?=3D $(CROSS_COMPILE)
> > + all:
> > +=A0=A0=A0=A0 $(MAKE) -C host CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" =
--no-builtin-variables
> > +=A0=A0=A0=A0 $(MAKE) -C ta CROSS_COMPILE=3D"$(TA_CROSS_COMPILE)" LDFL=
AGS=3D""
> > +-=A0=A0=A0 $(MAKE) -C syslog CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)"
> > ++=A0=A0=A0 $(MAKE) -C syslog CROSS_COMPILE=3D"$(HOST_CROSS_COMPILE)" =
--no-builtin-variables
> > +
> > + .PHONY: clean
> > + clean:
> > +diff --git a/plugins/host/Makefile b/plugins/host/Makefile
> > +index 7285104..76244c7 100644
> > +--- a/plugins/host/Makefile
> > ++++ b/plugins/host/Makefile
> > +@@ -20,7 +20,7 @@ BINARY =3D optee_example_plugins
> > + all: $(BINARY)
> > +
> > + $(BINARY): $(OBJS)
> > +-=A0=A0=A0 $(CC) -o $@ $< $(LDADD)
> > ++=A0=A0=A0 $(CC) $(LDFLAGS) -o $@ $< $(LDADD)
> > +
> > + .PHONY: clean
> > + clean:
> > +diff --git a/plugins/syslog/Makefile b/plugins/syslog/Makefile
> > +index 62d916a..71f5f92 100644
> > +--- a/plugins/syslog/Makefile
> > ++++ b/plugins/syslog/Makefile
> > +@@ -1,3 +1,11 @@
> > ++CC=A0=A0=A0=A0=A0 ?=3D $(CROSS_COMPILE)gcc
> > ++LD=A0=A0=A0=A0=A0 ?=3D $(CROSS_COMPILE)ld
> > ++AR=A0=A0=A0=A0=A0 ?=3D $(CROSS_COMPILE)ar
> > ++NM=A0=A0=A0=A0=A0 ?=3D $(CROSS_COMPILE)nm
> > ++OBJCOPY ?=3D $(CROSS_COMPILE)objcopy
> > ++OBJDUMP ?=3D $(CROSS_COMPILE)objdump
> > ++READELF ?=3D $(CROSS_COMPILE)readelf
> > ++
> > + PLUGIN_UUID =3D 96bcf744-4f72-4866-bf1d-8634fd9c65e5
> > +
> > + PLUGIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 =3D $(PLUGIN_UUID).plugin
> > +@@ -6,17 +14,17 @@ PLUGIN_OBJ=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 =3D $(patsubst %.c, %.o, $(PLUGIN_SRS))
> > + PLUGIN_INCLUDES_DIR =3D $(CURDIR) $(TEEC_EXPORT)/include
> > +
> > + PLUGIN_INCLUDES=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D $(addprefix =
-I, $(PLUGIN_INCLUDES_DIR))
> > +-PLUGIN_CCFLAGS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D -Wall -fPI=
C
> > +-PLUGIN_LDFLAGS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D -shared
> > ++PLUGIN_CCFLAGS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D $(CFLAGS) =
-Wall -fPIC
> > ++PLUGIN_LDFLAGS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D $(LDFLAGS)=
 -shared
> > +
> > + .PHONY: all
> > + all: $(PLUGIN)
> > +
> > + $(PLUGIN): $(PLUGIN_OBJ)
> > +-=A0=A0=A0 $(CROSS_COMPILE)gcc $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
> > ++=A0=A0=A0 $(CC) $(PLUGIN_LDFLAGS) $(PLUGIN_OBJ) -o $@
> > +
> > + %.o: %.c
> > +-=A0=A0=A0 $(CROSS_COMPILE)gcc $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -=
c $*.c -o $*.o
> > ++=A0=A0=A0 $(CC) $(PLUGIN_CCFLAGS) $(PLUGIN_INCLUDES) -c $*.c -o $*.o
> > +
> > + .PHONY: clean
> > + clean:
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-arm/recipes-security/optee/optee-examples/0002-Makef=
ile-Enable-plugins-installation-in-rootfs.patch b/meta-arm/recipes-security=
/optee/optee-examples/0002-Makefile-Enable-plugins-installation-in-rootfs.p=
atch
> > new file mode 100644
> > index 0000000..8d1d60a
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-examples/0002-Makefile-Ena=
ble-plugins-installation-in-rootfs.patch
> > @@ -0,0 +1,39 @@
> > +From a865f2e25e178fc2c4617eb1faf79ac922d02ffd Mon Sep 17 00:00:00 200=
1
> > +From: Sumit Garg <sumit.garg@linaro.org>
> > +Date: Tue, 20 Jul 2021 14:20:10 +0530
> > +Subject: [PATCH 2/2] Makefile: Enable plugins installation in rootfs
> > +
> > +Upstream-Status: Submitted [https://github.com/linaro-swg/optee_examp=
les/pull/87]
> > +
> > +Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > +---
> > + Makefile | 5 +++++
> > + 1 file changed, 5 insertions(+)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index a275842..b3f16aa 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -25,14 +25,19 @@ prepare-for-rootfs: examples
> > +=A0=A0=A0=A0 @mkdir -p $(OUTPUT_DIR)
> > +=A0=A0=A0=A0 @mkdir -p $(OUTPUT_DIR)/ta
> > +=A0=A0=A0=A0 @mkdir -p $(OUTPUT_DIR)/ca
> > ++=A0=A0=A0 @mkdir -p $(OUTPUT_DIR)/plugins
> > +=A0=A0=A0=A0 @for example in $(EXAMPLE_LIST); do \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ -e $$example/host/optee_exa=
mple_$$example ]; then \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cp -p $$=
example/host/optee_example_$$example $(OUTPUT_DIR)/ca/; \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi; \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cp -pr $$example/ta/*.ta $(OUTPU=
T_DIR)/ta/; \
> > ++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ $$example =3D=3D plugins ]; t=
hen \
> > ++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cp -p plug=
ins/syslog/*.plugin $(OUTPUT_DIR)/plugins/; \
> > ++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi; \
> > +=A0=A0=A0=A0 done
> > +
> > + prepare-for-rootfs-clean:
> > +=A0=A0=A0=A0 @rm -rf $(OUTPUT_DIR)/ta
> > +=A0=A0=A0=A0 @rm -rf $(OUTPUT_DIR)/ca
> > ++=A0=A0=A0 @rm -rf $(OUTPUT_DIR)/plugins
> > +=A0=A0=A0=A0 @rmdir --ignore-fail-on-non-empty $(OUTPUT_DIR) || test =
! -e $(OUTPUT_DIR)
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb =
b/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
> > deleted file mode 100644
> > index 72473ed..0000000
> > --- a/meta-arm/recipes-security/optee/optee-examples_3.11.0.bb
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -require optee-examples.inc
> > -
> > -SRCREV =3D "9a7dc598591990349d88b4dba3a37aadd6851295"
> > -
> > diff --git a/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb =
b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > new file mode 100644
> > index 0000000..f2b5f7d
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-examples_3.14.0.bb
> > @@ -0,0 +1,4 @@
> > +require optee-examples.inc
> > +
> > +SRCREV =3D "e9c870525af8f7e7fccf575a0ca5394ce55adcec"
> > +
> > diff --git a/meta-arm/recipes-security/optee/optee-os/0001-libutils-pr=
ovide-empty-__getauxval-implementation.patch b/meta-arm/recipes-security/op=
tee/optee-os/0001-libutils-provide-empty-__getauxval-implementation.patch
> > deleted file mode 100644
> > index 0120f5c..0000000
> > --- a/meta-arm/recipes-security/optee/optee-os/0001-libutils-provide-e=
mpty-__getauxval-implementation.patch
> > +++ /dev/null
> > @@ -1,62 +0,0 @@
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -From 36e784f621bf5d5be9183beba35f39426277c110 Mon Sep 17 00:00:00 200=
1
> > -From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > -Date: Tue, 13 Oct 2020 22:45:39 +0300
> > -Subject: [PATCH 1/3] libutils: provide empty __getauxval() implementa=
tion
> > -
> > -Never version of libgcc are built with LSE implementation in mind. To
> > -determine if LSE is available on platform it calls __getauxval(), so =
in
> > -some cases we can get undefined reference to __getauxval() error.
> > -
> > -Prominent case is libgcc_eh.a library, which is used by C++ TAs. Exce=
ption
> > -handler depends on atomic operations, so it tries to call
> > -init_have_lse_atomics() first. This function in turn calls __getauxva=
l(),
> > -which causes linking error.
> > -
> > -In the future we can make __getauxval() to return actual platform
> > -capabilities.
> > -
> > -Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > -Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
> > -Reviewed-by: Jerome Forissier <jerome@forissier.org>
> > ----
> > - lib/libutils/ext/arch/arm/auxval.c | 12 ++++++++++++
> > - lib/libutils/ext/arch/arm/sub.mk=A0=A0 |=A0 1 +
> > - 2 files changed, 13 insertions(+)
> > - create mode 100644 lib/libutils/ext/arch/arm/auxval.c
> > -
> > -diff --git a/lib/libutils/ext/arch/arm/auxval.c b/lib/libutils/ext/ar=
ch/arm/auxval.c
> > -new file mode 100644
> > -index 00000000..98bca850
> > ---- /dev/null
> > -+++ b/lib/libutils/ext/arch/arm/auxval.c
> > -@@ -0,0 +1,12 @@
> > -+// SPDX-License-Identifier: BSD-2-Clause
> > -+/*
> > -+ * Copyright (c) 2020, EPAM Systems
> > -+ */
> > -+
> > -+#include <compiler.h>
> > -+
> > -+unsigned long int __getauxval (unsigned long int type);
> > -+unsigned long int __getauxval (unsigned long int type __unused)
> > -+{
> > -+=A0=A0=A0 return 0;
> > -+}
> > -diff --git a/lib/libutils/ext/arch/arm/sub.mk b/lib/libutils/ext/arch=
/arm/sub.mk
> > -index dc5eed67..2e779066 100644
> > ---- a/lib/libutils/ext/arch/arm/sub.mk
> > -+++ b/lib/libutils/ext/arch/arm/sub.mk
> > -@@ -3,6 +3,7 @@ srcs-$(CFG_ARM32_$(sm)) +=3D aeabi_unwind.c
> > - endif
> > - srcs-$(CFG_ARM32_$(sm)) +=3D atomic_a32.S
> > - srcs-$(CFG_ARM64_$(sm)) +=3D atomic_a64.S
> > -+srcs-y +=3D auxval.c
> > - ifneq ($(sm),ldelf) # TA, core
> > - srcs-$(CFG_ARM32_$(sm)) +=3D mcount_a32.S
> > - srcs-$(CFG_ARM64_$(sm)) +=3D mcount_a64.S
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-arm/recipes-security/optee/optee-os/0002-link.mk-imp=
lement-support-for-libnames-after-libgcc-.patch b/meta-arm/recipes-security=
/optee/optee-os/0002-link.mk-implement-support-for-libnames-after-libgcc-.p=
atch
> > deleted file mode 100644
> > index 11296c8..0000000
> > --- a/meta-arm/recipes-security/optee/optee-os/0002-link.mk-implement-=
support-for-libnames-after-libgcc-.patch
> > +++ /dev/null
> > @@ -1,55 +0,0 @@
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -From 73196b58ea6978ffa5e581738030f51c5789ef73 Mon Sep 17 00:00:00 200=
1
> > -From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > -Date: Tue, 13 Oct 2020 22:54:13 +0300
> > -Subject: [PATCH 2/3] link.mk: implement support for libnames-after-li=
bgcc
> > - variable
> > -
> > -Newer versions of libgcc depend on external __getauxval() symbol, whi=
ch is
> > -now provided by libutils. But libgcc is linked after libutils, so lin=
ker
> > -can't resolve that symbol. We can't include libgcc into linking group=
 with
> > -libtutils, because libgcc provides symbols that conflict with libutil=
's
> > -ones, like __aeabi_idiv with friends for instance.
> > -
> > -So, to resolve libgcc dependency on libutils we need to link with lib=
utils
> > -second time. To make things more generic, we will introduce
> > -$(libnames-after-libgcc) variable for libraries that should be linked=
 after
> > -libgcc.
> > -
> > -Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > -Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
> > -Reviewed-by: Jerome Forissier <jerome@forissier.org>
> > ----
> > - ta/arch/arm/link.mk | 6 +++++-
> > - 1 file changed, 5 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/ta/arch/arm/link.mk b/ta/arch/arm/link.mk
> > -index 445c285d..3025acb1 100644
> > ---- a/ta/arch/arm/link.mk
> > -+++ b/ta/arch/arm/link.mk
> > -@@ -55,8 +55,11 @@ link-ldflags +=3D --eh-frame-hdr
> > - link-ldadd +=3D $(libstdc++$(sm)) $(libgcc_eh$(sm))
> > - endif
> > - link-ldadd +=3D --end-group
> > --ldargs-$(user-ta-uuid).elf :=3D $(link-ldflags) $(objs) $(link-ldadd=
) $(libgcc$(sm))
> > -
> > -+link-ldadd-after-libgcc +=3D $(addprefix -l,$(libnames-after-libgcc)=
)
> > -+
> > -+ldargs-$(user-ta-uuid).elf :=3D $(link-ldflags) $(objs) $(link-ldadd=
) \
> > -+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 $(libgcc$(sm)) $(link-ldadd-after-libgcc)
> > -
> > - link-script-cppflags-$(sm) :=3D \
> > -=A0=A0=A0=A0 $(filter-out $(CPPFLAGS_REMOVE) $(cppflags-remove), \
> > -@@ -76,6 +79,7 @@ $(link-script-pp$(sm)): $(link-script$(sm)) $(conf-=
file) $(link-script-pp-makefi
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(link-script-cppflags-$(sm)) $$=
< -o $$@
> > -
> > - $(link-out-dir$(sm))/$(user-ta-uuid).elf: $(objs) $(libdeps) \
> > -+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(libdeps-after-libgcc) \
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(link-script-pp$(sm)) \
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(dynlistdep) \
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(additional-link-deps)
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-arm/recipes-security/optee/optee-os/0003-ta_dev_kit.=
mk-make-sure-that-libutils-is-linked-seco.patch b/meta-arm/recipes-security=
/optee/optee-os/0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked-seco.p=
atch
> > deleted file mode 100644
> > index 88ba5f8..0000000
> > --- a/meta-arm/recipes-security/optee/optee-os/0003-ta_dev_kit.mk-make=
-sure-that-libutils-is-linked-seco.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -From f50962e3f56f0932662b2ffa10afe53339a335dd Mon Sep 17 00:00:00 200=
1
> > -From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > -Date: Fri, 16 Oct 2020 16:36:08 +0300
> > -Subject: [PATCH 3/3] ta_dev_kit.mk: make sure that libutils is linked=
 second
> > - time
> > -
> > -libgcc depends on __getauxval symbol from libuils. As, generally libu=
tils
> > -is linked before libgcc, we will get "unresolved symbol" error. To re=
solve
> > -this dependency we need to link libutils second time - after libgcc.
> > -
> > -Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > -Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
> > -Reviewed-by: Jerome Forissier <jerome@forissier.org>
> > ----
> > - ta/mk/ta_dev_kit.mk | 10 ++++++++++
> > - 1 file changed, 10 insertions(+)
> > -
> > -diff --git a/ta/mk/ta_dev_kit.mk b/ta/mk/ta_dev_kit.mk
> > -index e28be677..d0e66317 100644
> > ---- a/ta/mk/ta_dev_kit.mk
> > -+++ b/ta/mk/ta_dev_kit.mk
> > -@@ -78,6 +78,16 @@ endif
> > - libnames +=3D dl
> > - libdeps +=3D $(ta-dev-kit-dir$(sm))/lib/libdl.a
> > -
> > -+# libutils provides __getauxval symbol which is needed by libgcc 10.=
x. We can't
> > -+# link libutils after libgcc, because libgcc will replace some symbo=
ls provided
> > -+# by libutils, which will cause further linking issues.
> > -+#
> > -+# But if we place libutils before libgcc, linker will not be able to=
 resolve
> > -+# __getauxval. So we need to link with libutils twice: before and af=
ter libgcc.
> > -+# Hence it included both in $(libnames) and in $(libnames-after-libg=
cc)
> > -+libnames-after-libgcc +=3D utils
> > -+libdeps-after-libgcc +=3D $(ta-dev-kit-dir$(sm))/lib/libutils.a
> > -+
> > - # Pass config variable (CFG_) from conf.mk on the command line
> > - cppflags$(sm) +=3D $(strip \
> > -=A0=A0=A0=A0 $(foreach var, $(filter CFG_%,$(.VARIABLES)), \
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-arm/recipes-security/optee/optee-os_3.11.0.bb b/meta=
-arm/recipes-security/optee/optee-os_3.11.0.bb
> > deleted file mode 100644
> > index 13b3dc6..0000000
> > --- a/meta-arm/recipes-security/optee/optee-os_3.11.0.bb
> > +++ /dev/null
> > @@ -1,11 +0,0 @@
> > -require optee-os.inc
> > -
> > -SRCREV =3D "c4def2a8262a03244d9a88461699b9b8e43c6b55"
> > -
> > -SRC_URI_append =3D " \
> > -=A0=A0=A0 file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> > -=A0=A0=A0 file://0007-allow-setting-sysroot-for-clang.patch \
> > -=A0=A0=A0 file://0001-libutils-provide-empty-__getauxval-implementati=
on.patch \
> > -=A0=A0=A0 file://0002-link.mk-implement-support-for-libnames-after-li=
bgcc-.patch \
> > -=A0=A0=A0 file://0003-ta_dev_kit.mk-make-sure-that-libutils-is-linked=
-seco.patch \
> > -"
> > diff --git a/meta-arm/recipes-security/optee/optee-os_3.14.0.bb b/meta=
-arm/recipes-security/optee/optee-os_3.14.0.bb
> > new file mode 100644
> > index 0000000..3289e2c
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-os_3.14.0.bb
> > @@ -0,0 +1,8 @@
> > +require optee-os.inc
> > +
> > +SRCREV =3D "d21befa5e53eae9db469eba1685f5aa5c6f92c2f"
> > +
> > +SRC_URI_append =3D " \
> > +=A0=A0=A0 file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> > +=A0=A0=A0 file://0007-allow-setting-sysroot-for-clang.patch \
> > +"
> > diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm=
/recipes-security/optee/optee-test.inc
> > index f09b9d2..bcbcc06 100644
> > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > @@ -8,17 +8,9 @@ LIC_FILES_CHKSUM =3D "file://${S}/LICENSE.md;md5=3Dda=
a2bcccc666345ab8940aab1315a4fa"
> >=A0 inherit python3native ptest
> >=A0 require optee.inc
> >
> > -# Linking fails on musl due to C++/threads
> > -# https://github.com/OP-TEE/optee_test/issues/458#issuecomment-720540=
834
> > -# When upgraded we should be able to remove this limitation
> > -COMPATIBLE_HOST_libc-musl =3D 'null'
> > -
> >=A0 DEPENDS =3D "optee-client optee-os python3-pycryptodome-native"
> >
> >=A0 SRC_URI =3D "git://github.com/OP-TEE/optee_test.git \
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0001-host-xtest-Adjust-order-of=
-including-compiler.h.patch \
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0002-make-remove-Wno-unsafe-loo=
p-for-clang.patch \
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://0003-make-remove-Wmissing-noret=
urn-for-clang.patch \
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file://run-ptest \
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >
> > @@ -36,6 +28,7 @@ do_compile() {
> >=A0=A0=A0=A0=A0 # Top level makefile doesn't seem to handle parallel ma=
ke gracefully
> >=A0=A0=A0=A0=A0 oe_runmake xtest
> >=A0=A0=A0=A0=A0 oe_runmake ta
> > +=A0=A0=A0 oe_runmake test_plugin
> >=A0 }
> >=A0 do_compile[cleandirs] =3D "${B}"
> >
> > @@ -46,9 +39,13 @@ do_install () {
> >=A0=A0=A0=A0=A0 # default TEEC_LOAD_PATH is /lib
> >=A0=A0=A0=A0=A0 mkdir -p ${D}${nonarch_base_libdir}/optee_armtz/
> >=A0=A0=A0=A0=A0 install -D -p -m0444 ${B}/ta/*/*.ta ${D}${nonarch_base_=
libdir}/optee_armtz/
> > +=A0=A0=A0 mkdir -p ${D}${libdir}/tee-supplicant/plugins
> > +=A0=A0=A0 install -D -p -m0444 ${B}/supp_plugin/*.plugin ${D}${libdir=
}/tee-supplicant/plugins/
> >=A0 }
> >
> > -FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/"
> > +FILES_${PN} +=3D "${nonarch_base_libdir}/optee_armtz/ \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ${libdir}/tee-supplican=
t/plugins/ \
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "
> >
> >=A0 # Imports machine specific configs from staging to build
> >=A0 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > diff --git a/meta-arm/recipes-security/optee/optee-test/0001-host-xtes=
t-Adjust-order-of-including-compiler.h.patch b/meta-arm/recipes-security/op=
tee/optee-test/0001-host-xtest-Adjust-order-of-including-compiler.h.patch
> > deleted file mode 100644
> > index 3c500d7..0000000
> > --- a/meta-arm/recipes-security/optee/optee-test/0001-host-xtest-Adjus=
t-order-of-including-compiler.h.patch
> > +++ /dev/null
> > @@ -1,64 +0,0 @@
> > -From fc95b3ccbbfd336797ae2cfd6dd4dc58644e146f Mon Sep 17 00:00:00 200=
1
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 30 May 2020 17:52:18 -0700
> > -Subject: [PATCH] host/xtest: Adjust order of including compiler.h
> > -
> > -compiler.h defines some defines which violate libc namespace e.g.
> > -__unused, this works ok with glibc but fails in awkward ways with mus=
l
> > -the reason is musl uses __unused in its internal structures and this
> > -define in compiler.h conflicts with system headers causing errors lik=
e
> > -
> > -recipe-sysroot/usr/include/bits/stat.h:17:19: error: expected identif=
ier or '(' before '[' token unsigned __unused[2];
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^
> > -including compiler.h afer sys/stat.h fixes the problem.
> > -
> > -Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/issues=
/453]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - host/xtest/install_ta.c | 2 +-
> > - host/xtest/stats.c=A0=A0=A0=A0=A0 | 2 +-
> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/host/xtest/install_ta.c b/host/xtest/install_ta.c
> > -index 09a4c6d..6f7bb5c 100644
> > ---- a/host/xtest/install_ta.c
> > -+++ b/host/xtest/install_ta.c
> > -@@ -4,7 +4,6 @@
> > -=A0 * SPDX-License-Identifier: BSD-2-Clause
> > -=A0 */
> > -
> > --#include <compiler.h>
> > - #include <dirent.h>
> > - #include <err.h>
> > - #include <errno.h>
> > -@@ -20,6 +19,7 @@
> > - #include <sys/types.h>
> > - #include <tee_client_api.h>
> > - #include <unistd.h>
> > -+#include <compiler.h>
> > -
> > - #include "install_ta.h"
> > - #include "xtest_helpers.h"
> > -diff --git a/host/xtest/stats.c b/host/xtest/stats.c
> > -index 96b0b5f..db9bf25 100644
> > ---- a/host/xtest/stats.c
> > -+++ b/host/xtest/stats.c
> > -@@ -3,7 +3,6 @@
> > -=A0 * Copyright (c) 2019, Linaro Limited
> > -=A0 */
> > -
> > --#include <compiler.h>
> > - #include <dirent.h>
> > - #include <err.h>
> > - #include <errno.h>
> > -@@ -18,6 +17,7 @@
> > - #include <sys/types.h>
> > - #include <tee_client_api.h>
> > - #include <unistd.h>
> > -+#include <compiler.h>
> > - #include "xtest_test.h"
> > - #include "stats.h"
> > -
> > ---
> > -2.26.2
> > -
> > diff --git a/meta-arm/recipes-security/optee/optee-test/0002-make-remo=
ve-Wno-unsafe-loop-for-clang.patch b/meta-arm/recipes-security/optee/optee-=
test/0002-make-remove-Wno-unsafe-loop-for-clang.patch
> > deleted file mode 100644
> > index 17dd7d8..0000000
> > --- a/meta-arm/recipes-security/optee/optee-test/0002-make-remove-Wno-=
unsafe-loop-for-clang.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From 438533ce9da1df0b7c7914e64b39ffdc1da1ab79 Mon Sep 17 00:00:00 200=
1
> > -From: Brett Warren <brett.warran@arm.com>
> > -Date: Thu, 8 Oct 2020 10:03:25 +0100
> > -Subject: [PATCH] make: remove -Wmissing-noreturn for clang
> > -
> > -When compiling when clang, -Wmissing-noreturn causes an error because
> > -of non-compliant code. This option is removed to workaround this.
> > -
> > -Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/issues=
/452]
> > -Changed-Id: 71cb511904547d790d1ea98f93bf8e5a6afcb36d
> > -Signed-off-by: Brett Warren <brett.warren@arm.com>
> > ----
> > - host/xtest/Makefile | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/host/xtest/Makefile b/host/xtest/Makefile
> > -index 3c206b0..96746de 100644
> > ---- a/host/xtest/Makefile
> > -+++ b/host/xtest/Makefile
> > -@@ -169,7 +169,7 @@ CFLAGS +=3D -Wall -Wcast-align -Werror \
> > -=A0=A0=A0=A0=A0=A0 -Werror-implicit-function-declaration -Wextra -Wfl=
oat-equal \
> > -=A0=A0=A0=A0=A0=A0 -Wformat-nonliteral -Wformat-security -Wformat=3D2=
 -Winit-self \
> > -=A0=A0=A0=A0=A0=A0 -Wmissing-declarations -Wmissing-format-attribute =
\
> > --=A0=A0=A0=A0=A0 -Wmissing-include-dirs -Wmissing-noreturn \
> > -+=A0=A0=A0=A0=A0 -Wmissing-include-dirs \
> > -=A0=A0=A0=A0=A0=A0 -Wmissing-prototypes -Wnested-externs -Wpointer-ar=
ith \
> > -=A0=A0=A0=A0=A0=A0 -Wshadow -Wstrict-prototypes -Wswitch-default \
> > -=A0=A0=A0=A0=A0=A0 -Wwrite-strings \
> > ---
> > -2.17.1
> > -
> > diff --git a/meta-arm/recipes-security/optee/optee-test/0003-make-remo=
ve-Wmissing-noreturn-for-clang.patch b/meta-arm/recipes-security/optee/opte=
e-test/0003-make-remove-Wmissing-noreturn-for-clang.patch
> > deleted file mode 100644
> > index bbc303f..0000000
> > --- a/meta-arm/recipes-security/optee/optee-test/0003-make-remove-Wmis=
sing-noreturn-for-clang.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From ed5a9d9f7a3e9e14ca0e8aea59008124ee0e5f96 Mon Sep 17 00:00:00 200=
1
> > -From: Brett Warren <brett.warren@arm.com>
> > -Date: Thu, 8 Oct 2020 10:20:52 +0100
> > -Subject: [PATCH] make: remove -Wno-unsafe-loop for clang
> > -
> > -When compiling with clang, the -Wno-unsafe-loop-optimizations option
> > -throws an error because clang doesn't recognise it. This option is
> > -removed to workaround this.
> > -
> > -Upstream-Status: Pending [https://github.com/OP-TEE/optee_test/issues=
/452]
> > -Change-Id: 5fe0892c73208aaffac8c9995cb3275936fb1ba6
> > -Signed-off-by: Brett Warren <brett.warren@arm.com>
> > ----
> > - host/xtest/Makefile | 1 -
> > - 1 file changed, 1 deletion(-)
> > -
> > -diff --git a/host/xtest/Makefile b/host/xtest/Makefile
> > -index 96746de..73731d0 100644
> > ---- a/host/xtest/Makefile
> > -+++ b/host/xtest/Makefile
> > -@@ -174,7 +174,6 @@ CFLAGS +=3D -Wall -Wcast-align -Werror \
> > -=A0=A0=A0=A0=A0=A0 -Wshadow -Wstrict-prototypes -Wswitch-default \
> > -=A0=A0=A0=A0=A0=A0 -Wwrite-strings \
> > -=A0=A0=A0=A0=A0=A0 -Wno-declaration-after-statement \
> > --=A0=A0=A0=A0=A0 -Wno-unsafe-loop-optimizations \
> > -=A0=A0=A0=A0=A0=A0 -Wno-missing-field-initializers -Wno-format-zero-l=
ength
> > - endif
> > -
> > ---
> > -2.17.1
> > -
> > diff --git a/meta-arm/recipes-security/optee/optee-test_3.11.0.bb b/me=
ta-arm/recipes-security/optee/optee-test_3.11.0.bb
> > deleted file mode 100644
> > index 0f8b5b0..0000000
> > --- a/meta-arm/recipes-security/optee/optee-test_3.11.0.bb
> > +++ /dev/null
> > @@ -1,3 +0,0 @@
> > -require optee-test.inc
> > -
> > -SRCREV =3D "159e295d5cc3ad2275ab15fe544620f6604d4ba4"
> > diff --git a/meta-arm/recipes-security/optee/optee-test_3.14.0.bb b/me=
ta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > new file mode 100644
> > index 0000000..6367c27
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-test_3.14.0.bb
> > @@ -0,0 +1,3 @@
> > +require optee-test.inc
> > +
> > +SRCREV =3D "f2eb88affbb7f028561b4fd5cbd049d5d704f741"
> > --
> > 2.25.1
> >
>
> >
> >=20
> >
>
