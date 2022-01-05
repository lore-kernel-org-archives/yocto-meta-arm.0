Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC95C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 12:51:50 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web08.6301.1641387107743812189
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jan 2022 04:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=ugnYyYGg;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.63,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exgrbqAwoNiS5UKN7dpsvJ8OZJUmtGxze6gnAfKzG14QKFjgEz/h5UIOWpbgg2T7ztpH6rRq7nwvjfv+KYtL9qDVGzhNG3QC+ur9tEW882pBYMadRCL2MJe6gR4fzBIY0liXCTPwgkP0i2a1cYwWn9fQkE5sGVP2L9ArHB1EBQswjMaE+dqPnNXxwQ6yc376MK8qIHTBQ0u9IlD4Cay27HpICcXQ1UcJPi0vQW+UhUq4Rp1NelIU+dpKFFQfTckNUHUufXlSktZ7LT2DVDa2tDAzEQFpAhBtNRYGGb6n5Uk8ZBDXwYs9m+3FjtkXn1G+KwR6UwDxmKm8PyopWjl39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtymmCa/GjqzfD4FTkDt/zgVccr88RvTgwUY7P2A43Y=;
 b=bYxJyzr0sIN7KgItqRQcijDXIB8dgbOxVLSuqk5jZ/SbQ8Var4Q15sleBnO7Ko2E+/RZMZNKDQZZfs9Tvi0NvknvYLWeU7pWDgbDv5FIWVUoJaidkDaF+UldveVa2Ptp/YKTEqflF9Xhv1VjWMgjEYVUxUdBnz1waMEkEruNk4WxyrjihPWvc56ysaLJI4ELMJDesJ4nnWkgrRMKWFIM6oxWcKZP6rig6itlGVkvz8tZyhMdFEXQ51SsGWr6wxeVd/A8ydu2Tzf0VbS2BqOZlxSpXHZbZpaMk9Avj7Dv9JgsFfvCiXsd/npYFNzAE3vrlHaaDwp8YTXwbDnnKayp/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtymmCa/GjqzfD4FTkDt/zgVccr88RvTgwUY7P2A43Y=;
 b=ugnYyYGgmHe1pQXupdFCjlFiLUXp741OR0VTRuPogcYHewenpO14Lrt/BVBR83htPJ/4uwBWqjQ2LujXviqgCkBYd1lrLXagqz8YmANdUGkPY3vJPNOiQe88fppHqSa/a+h8Dwn+9JTZO1O/SaeogFKHhZUC9o102THYCwpkjDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6495.eurprd08.prod.outlook.com (2603:10a6:102:dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.16; Wed, 5 Jan
 2022 12:51:45 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%9]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 12:51:45 +0000
Message-ID: <bc94d3a9-8732-554c-ba50-25ed7974464f@weidmueller.com>
Date: Wed, 5 Jan 2022 13:51:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [EXTERNAL] Re: [meta-arm] building gcc-arm-none-eabi from source
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Ross Burton <ross@burtonini.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
References: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
 <CAAnfSTvvyx+2ry+KQV_vx1+t7eqH7NDkhqkaUgDzv1eHUPDZbA@mail.gmail.com>
 <CANNYZj-JOXzsgo7fJfoB45Ldtxknd4Bv6Ya3QVFYa-0V3x_cbA@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj-JOXzsgo7fJfoB45Ldtxknd4Bv6Ya3QVFYa-0V3x_cbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0020.eurprd07.prod.outlook.com
 (2603:10a6:203:51::30) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4fd9494-5810-4069-3ff8-08d9d04a211a
X-MS-TrafficTypeDiagnostic: PAXPR08MB6495:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB64952FCDFE6398595A454F50D74B9@PAXPR08MB6495.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k5XYPcezvoGI3iU2+NdfInIX22pTiFORa4StysTY+KQ4tEMLpox3Y8CDMz+DmznE8dky3oK55VvJlHR/lfhZi6I7L0i6v5FTwlN6X+u/LYTRWVQR4yjtfU+df50oNOwgvSwVr8KCYZ8Reqgh9GoOoymulIF6/wbRM/MRa+GOqC3YSGdWgocXsVfTuivYyvFZSC3eoYHn7HXvDMrkeqRjsUnCSPsBQkBGafXteEqVTzWAAcFIF1KqdPz4Ij1WTnkvyjh7sM2nd0xI/hYZsaJU8LsWAVJfYaKqR16A3jb24FJU8tXF6xLwmSqkEFXgKdqiXZgFuyf0bLNEI5g9/OAF2EaBxQAQnD9pWXvs5d3N3eD2D8rYliRAOD/rmt+plFYj6QgF8PXORs5QAvNnHcqltwySu6D7raVOsRKvBLeFng37fuLIcZkeCQe92KNcu6/l0FK78KUfOCyMrUXlwRmxjHj5YKKQOqdBqpjKPBn4416javtLIG9o/DFM1QGXDSwYZAz1UAOhhSupgSNDnaoQoiQc0SguGzyCFft/r3MpApxuskS+aUs4yCrvAiOBdUv9bxbOoWbWvv5grnu2YJOA6vJQbqNiLKGXv/+94hz/SZLEbkV3m5eDQ075nOKVfKEZ9BSmMB3aHNJHR21At7v6Zv6jJNgO5Q/cm71eEZ9bX5AwoHqdFKq15npTLHrULoNqK6gGgKgX/Jamltff3fq/vi/RkALw8TU/IQZwCuXWv+RmiJsH9vynFG0ywvbj9dfCCYm9XXAJ+HWn5v5xuL2muA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(4326008)(66476007)(316002)(8936002)(66946007)(38100700002)(508600001)(2906002)(6512007)(31686004)(2616005)(4744005)(5660300002)(186003)(8676002)(110136005)(36756003)(26005)(6506007)(38350700002)(52116002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXFsU2Q5cGdKR2VUYmdJNkpvS2JVRnZPZmVONHJZbnIrWGZuTGY1aHpFSklT?=
 =?utf-8?B?TnI2V1ZMMk1vdE83THhwbTI3SDRleUprRW5pUkpmTFBCcGEySGJueWlxVTkw?=
 =?utf-8?B?bmloOHlTN3lLOVZNSk84UGFmR1pHSHRUYzFkTElxYWhEeENoWnh3NHl3d1VI?=
 =?utf-8?B?Y2c5WFVTanNFR0h2UFRaVVliWUx0V2h4SEx1aGNEN1ltYm9TNHJzSEVaR21W?=
 =?utf-8?B?OEVnQkFsQlRCYjkwSG4wKzNKUmNVbFRrNnhFaWNab0xJNFRlZ1dWOWVvN3lQ?=
 =?utf-8?B?WGtFWDRDa0FLaUVhOXFSN3puYjNLNnIwWDdVVzIrRUt6NG1PTzZmNjN5cWUr?=
 =?utf-8?B?Nk9yVXpPc0RpY3lEYUY2VmYxZkJEbENpL21TYkFac25WcnJsY1g4a1NhZWxK?=
 =?utf-8?B?M1RLUE95aTdKUDBvSUoxK2RjMTVOZXZFb2pMRDFwSVpXK3dlczU1SWlDaVJW?=
 =?utf-8?B?NU4xM2tRK1V5ZmlPaExidiswVWdxWWFPbnBYcVVpNjZ6dktaZUlxRGxpU0pQ?=
 =?utf-8?B?NCtQQVdNTmR5OGp3Q0JiTjVyYjdsUE1rZjdOUis3WEI0bFFuVU9sdGNLbURz?=
 =?utf-8?B?VU1HVVZaLzVacG5aUG5yMS9SVmIwcEtmY25JWFljbzJjbmRrTTNwOUxDYXhT?=
 =?utf-8?B?ZGRSWmFBU2FGOTlsZEZiaGxhRkRKNUpCU0srVTdQQlBWNjJlaGdoZEppdk9s?=
 =?utf-8?B?ZkNBQUVJYmVQOXBGa3pGY3gzTUNxM0FZY3RTNmxJWHZBYndlM3pteHZ2RWVI?=
 =?utf-8?B?UHRlaHowNEx5dHI0UGNneWtYS0NqQkM1UUprZE80Szd2Ynp0SmdJUE5IbjB3?=
 =?utf-8?B?RmxzNjArWnRETUZUdjVrZU8xTU5vblR2M3NFVGoxckJNekkxKzFoTGVCeGxQ?=
 =?utf-8?B?ak1ycU1uT3V4dXBBZlFmOVREMEY4NEEvcnhqSGFZQkxSbGZzeXJNUzZHN0hN?=
 =?utf-8?B?T1NUbmdsTFNJMXZ6Y29Ua0l4NTRUUEI4VTJnTlMyK0RUSWIzL2NtTXEyaHc1?=
 =?utf-8?B?ankyL3JiK0FhZEZhTzh5VzVLNUxmMXVldmxNbDF2SnVCNFJaWVJ5V21ab3Bn?=
 =?utf-8?B?blpvVmFaQVpxcWZaTzNaanpwU3orR0FLZFFZejdzTWNRSkVVb1VwQ1c0d0tr?=
 =?utf-8?B?Mk40aWlxYVgvYjV2S3FOSlVONjJsZTBkUDdwVVFmN3JWcko3U1U0azBoSHZJ?=
 =?utf-8?B?Rnh2RGkyT3ZqaUdTaUdlUmg4QWFVL0NlWmIzbU5QZzVCeHBoVFMwSE5jTjFu?=
 =?utf-8?B?djFtWnVNMk5OUXBwOEZsdjJsRU9vdXdNcjhyWnVPUk1McndDNkZER2RIc3hm?=
 =?utf-8?B?cEZnaVNMc3hhZzEyU3Z2cG9JNUcyS3pXT2l1YnhFRytmbnNkVE5Wc2RwS0VT?=
 =?utf-8?B?a0x2Qkw4N2pZaENPVXg3TXVib2Q0NTRSRWp2ZXdkWXdlVDBuMTF6aHEwNGdJ?=
 =?utf-8?B?MEMwa1VFdjVGejF3NzFQUzR0ZUtBSUxySENhUFVhR1RYQWpKZ3FGek90c2p6?=
 =?utf-8?B?ZTBQTnRNU1Z4RWNZVUZxWi91MkRBZzUyR21IdE5lelR1dHAyd1d0YzBjbXZE?=
 =?utf-8?B?WVBCQ3lLaXFOb212dncwc1Bwc2hGa3VINnBkUGVUdDlBK0RFSmhNS0w5L3R5?=
 =?utf-8?B?UEdNcEVhOGdxME5NajRvS1RYOEpNRW9NRzRySysrYnhEaGFUV0JoTkFMem4x?=
 =?utf-8?B?V05HajBiMmF4VWFDeEU5aWxlM1RHTU1pQUMxMk80WUFsd3NXQjVsaHhuUUNR?=
 =?utf-8?B?b3FhV1F2eWpWQVN5ZnpFWlIweVhhSUpKSGNobnhKZHBMZU5QUmdXVGZuN2Rh?=
 =?utf-8?B?SkhNamlHa3VNN3FwL1hnaWs3b2FsTGhDT3h2Q3cyRFlFOXZ3Z3Z3YkFwdUF1?=
 =?utf-8?B?Tm5sV25zZ3l1NXNPaWx2eVVhbFFrbTg1WU90VVJwN1N2OEd6bTJlSnptVmty?=
 =?utf-8?B?cUMxY28zbTkvL01SNVdhUWdXNmlWK0hFd2RhT2hLZmFPMWh2UEs4amx1SVAz?=
 =?utf-8?B?MWxFa3NRRG9xNUM3UWQzSGhrL0FjUk9SNGhmcDZHYUpmMlA3OFpPWVZhZzZn?=
 =?utf-8?B?TGpIQ1dQbDB0TnN2SkFlUFJhVFhPSzd3dUxpMkJPSFMrT3Bad3JHNmFTNy9j?=
 =?utf-8?B?akxEQnNkaC8rVjJqUjFiQ1llSHNxdzdXZFc2eTYzMHF0QllZaUJXK1VRbC9F?=
 =?utf-8?Q?z0XF4m7Jj+16P0mgpmvnEIs=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b4fd9494-5810-4069-3ff8-08d9d04a211a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 12:51:45.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 v7CQb1dxPl6xzhGBfxBG2F72Nm/epo6n/A18iJFoAc2C6H4fW7sk04IwJIJG5oyfKPQEDzVjEdpSmOAYrCNc+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6495
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Jan 2022 12:51:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2794

Am 04.01.2022 um 18:50 schrieb Alexander Kanavin:
> On Tue, 4 Jan 2022 at 16:39, Ross Burton <ross@burtonini.com 
> <mailto:ross@burtonini.com>> wrote:
> 
> 
>     Considering that the Arm GCC is mostly standard GCC with some
>     backports, and our GCC is often newer, simply using the standard GCC
>     (if the baremetal is arm-a) with -nostdlib should be sufficient?
> 
> 
> Stefan, can you clarify please? I think the baremetal side is not 
> actually arm-a?

We need a multilib compiler with newlib support for 32 bit arm-a, arm-r 
and most likely arm-m.

