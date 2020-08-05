Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.40])
 by mx.groups.io with SMTP id smtpd.web10.5475.1596628679298631170
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 04:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=c1o/DJ7U;
 spf=pass (domain: arm.com, ip: 40.107.0.40, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rePAIP+mTfO0CW9eE8RSFPnwM9SfgH3LFC2vA/Mm9JA=;
 b=c1o/DJ7UBbd+vhPGjznL2EiNse796JYr6uO3M3mqL0nDOPGR/WHbF+NtWsCqyOt8JXMQ97mqksz5Q/+4upINvmotjHe7bFAPpUfIDvltmGJ6pw3MwOv5wcVelYBMMN0VDYbME+tE960J7hWldKdMyRtpkxr+JQu1EIPM+G8odd4=
Received: from AM6P193CA0103.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::44)
 by DB6PR0801MB1703.eurprd08.prod.outlook.com (2603:10a6:4:2e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Wed, 5 Aug
 2020 11:57:56 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::d9) by AM6P193CA0103.outlook.office365.com
 (2603:10a6:209:88::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Wed, 5 Aug 2020 11:57:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Wed, 5 Aug 2020 11:57:55 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Wed, 05 Aug 2020 11:57:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c504686d56c4d04
X-CR-MTA-TID: 64aa7808
Received: from 0a02a5153758.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 71E3FD85-E4B3-4DD6-8746-367754C4844C.1;
	Wed, 05 Aug 2020 11:57:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a02a5153758.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Aug 2020 11:57:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKxtR1J0NcXgMlTfaXQijvo/T5xR0zyNlRZ6mMAW2mzH+LK2cf0R9Njhit66+5H0+AigyGz4jaSpkkCNMIQZJKzC2LHcHVJBjvuEWaTTPMhhVCylzpMt0sYYqKX48iokWVctlXcxpv0nh9oSGJMZbqgGUnYJB4x6upEeuqcvc11zKVUz+LBxkdO6rmDALZ/flDqhadcvn250Ky88ymojfrWkM9s9z8lOFSp6IxVQWuUysybD59+UjZeF6N2N76ZsaxMhJhKcStGKmaTNagydkE/GxqaRDqrVukdiNI5rMbdDCBJInz70j+Ff/Zi4t59PD3k5kswmdNbYRi2BwbGX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rePAIP+mTfO0CW9eE8RSFPnwM9SfgH3LFC2vA/Mm9JA=;
 b=M8yHbaoSTC42dRUZtJOjK4OavZG5FpLXKEp+KSrNGmo1iHuqLow5HXOIinL3oxMivt7euXm89f7nB08GajpAJaWeCV0CmfoFH9kNgaW0bOM7wafDY7mIphYRU+K3t8iK0CWbGftnheKpbYkk2uKtDw5qpJlMrrQURr62PQhcEvdIBMvQKV4b2J6ure4XAbx1cscGZ+C5WiK4+wO+EX8jdhjN2olnNMJ9AGFXttY1RXapPd8K1RIng6HVcRmlV3xaBpKHyv1A2ivrlhmu6ooANKBvpxzGIt4LrStK75Ycf/zfnJmzTWY8ljuTH6Z+KzGsmZQwW0as1gSTY//wcNvscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rePAIP+mTfO0CW9eE8RSFPnwM9SfgH3LFC2vA/Mm9JA=;
 b=c1o/DJ7UBbd+vhPGjznL2EiNse796JYr6uO3M3mqL0nDOPGR/WHbF+NtWsCqyOt8JXMQ97mqksz5Q/+4upINvmotjHe7bFAPpUfIDvltmGJ6pw3MwOv5wcVelYBMMN0VDYbME+tE960J7hWldKdMyRtpkxr+JQu1EIPM+G8odd4=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB8PR08MB4123.eurprd08.prod.outlook.com (2603:10a6:10:b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Wed, 5 Aug
 2020 11:57:47 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 11:57:47 +0000
Subject: Re: [PATCH v2 1/2] arm/trusted-firmware-a: add branch name for mbedtls
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
References: <20200805110620.20625-1-usama.arif@arm.com>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <0c43413e-2e23-fa6b-c22e-c3fb1e6611cc@arm.com>
Date: Wed, 5 Aug 2020 12:57:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200805110620.20625-1-usama.arif@arm.com>
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.52) by LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Wed, 5 Aug 2020 11:57:47 +0000
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 25d9cfd7-3109-4740-69e8-08d83936ca58
X-MS-TrafficTypeDiagnostic: DB8PR08MB4123:|DB6PR0801MB1703:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB170383042425E27B6D8159DC924B0@DB6PR0801MB1703.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Hj0cnIZixHm9bcRWVGvilHmXLZFAUWBsZbI1XBr62W3AnI6FT9dI7z1gI6ccLGs6HfKW1oQk3LaPUvMKCuLim6NYi44zLEkwcGPWHHuC8nmhxb+2xvZCnHV1FuBjsBUm1fXzW4ScXab7kOsYIvObvBnM2dfke8D6MTyNoXubOwfXZ3rhZurYRBkvmnRdMkpBh8WSbYc8xOPBukRp6SubMEFy6cxvum6rHP4Bnb/kXAUHPX23XbfsHUZaB3VU8Ftogtyx7cjhuUaeHkPxZn0XSfjwBxAFPVsqfY0CGMi2jCrOW0IYkAWKZqnBPs5Zg6JwtBJ7nng94f4ewlxAOBHXGOn6CKYnKl9cZOjawTty2ci5farjahfP8teWflZs/1BF
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(5660300002)(66946007)(26005)(36756003)(6486002)(86362001)(83380400001)(16526019)(52116002)(31696002)(53546011)(186003)(8936002)(956004)(66556008)(316002)(8676002)(478600001)(6916009)(16576012)(4326008)(2616005)(2906002)(31686004)(44832011)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 dhiNpr3DnNA9/vE5XCaYF7e7B2TM9dTtL+XxggWxA5HExA6CzM2sdKgcU8xq7EyVEUBxCkpKMD3hm7KkaPkfHkrdQgmnkzGRD/WsN5D1XPvnUKLHf8O9+q5DnCzFxmx8xFMyD9c10v2JadmVs6ovwrbK68JqEqzKuzSxPwyGhD/AW75FDoI7RFazNQv6CmdIIohKQhZCDPNHJ3SxRL/tjSgmjww+JpGVW9W8rvdBvQU/43uKATYTy0mQVoS5eFAhCbRfwZDlFS1anliD+sJisuC1aZsVgp7cHa9goHge7Y5kexemgc5U/ApBc2gDC1RBR1V1mvLfltS/guBaq9fBc43sEjl8Dd/P+vGJhPupSbkLED7ZuI6oYnML3VH5SamQXy1+2N08X8Z0RjfzUXXWLOBYAgO4QOSR15nKFixcK2UxG0Lz8QvPlosV9UuGZMU+uH1F37jP7kbvvlftwwcRwzlU6zBr4vNH4qMKaPLpBryKP51rvfVrYEVopppEC4avUFBiYotW64YexPMIE01DNPC2sJI7EdC+HN6q5EuAKHgbDwqsPyXFT7lRvrT9Icti4nfMPp4UcOLLJUCnp8gCfdRIDBwwrzZXn2sF0C68+5DYI3U8kqtqTinNWvGtMCapuNLdIrMCk1d9jucCXY0WNg==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4123
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5232407e-48ac-42d8-0313-08d83936c54e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4URYNFRj9XPfL2I0RozAUMGGcfakLtDoLoRv0nh+Y8FmVEpPKUlwbDfOzXFokDtIjT2sjFVMxx/S3+mS3Nuvzy1fhpxdE1pvqGXw09ZEZr8qe9dAXprZRYNwyjiyRK0YvMA8VrcVgQyy3GzW7rlQjwLiPn3wAidw0wDEG1K15Gpm/1z/gaHFMMGivDnVv4qJ5dbmYv0eDMvUwyaomHjHEXIyIYdRLcgTdki/Bj46443gFj0j5D5T793u2cHb3neG8jzqF66XajyiIw+Jij6SfWcvsaKydSyatp7FdofPw22VXnXMkvzb1wMjL7qgXHdup5phHcXm9nJgpbm0ZVbfpRhbf3O8GIHfbzH84e547J9STbvlwMuXhPEqDOZR0W39yynrOQjWngGPVaygSQfTLLL9g/KiBBaIyV4LYcOSt7pq4ns2GzYKd2o3LyRMHvJV
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(478600001)(53546011)(31696002)(356005)(956004)(86362001)(31686004)(82310400002)(81166007)(36756003)(2906002)(2616005)(8936002)(47076004)(83380400001)(26005)(82740400003)(44832011)(8676002)(6486002)(186003)(16526019)(6916009)(336012)(4326008)(36906005)(70586007)(5660300002)(316002)(70206006)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 11:57:55.8124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d9cfd7-3109-4740-69e8-08d83936ca58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1703
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi

Could the 2 patches be merged in dunfell as well. Without these patches, 
dunfell would be broken for all bsps' that use mbedtls.

Thanks,
Usama

On 05/08/2020 12:06, Usama Arif wrote:
> It appears that the mbedtls team have moved the SHA which
> meta-arm was using from master branch. It is still present
> in mbedtls-2.18 branch so this is now used.
> 
> Change-Id: Ie932f446067767e85a25583b1bdc02b4739e323f
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> Signed-off-by: Prabin CA <prabin.ca@rm.com>
> ---
>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> index 8286b64..7279173 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
> @@ -21,7 +21,7 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89
>   # Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
>   #
>   
> -SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
> +SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls;branch=mbedtls-2.18"
>   
>   # mbed TLS v2.18.1
>   SRCREV_mbedtls = "ca933c7e0c9e84738b168b6b0feb89af4183a60a"
> 
