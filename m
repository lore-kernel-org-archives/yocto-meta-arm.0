Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9850.1589969630769357967
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 May 2020 03:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YJUzyVIs;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: wmills@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KADi0V032474;
	Wed, 20 May 2020 05:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589969624;
	bh=exgY5RnTT+/jJBKUgLQQDYvtW/BSxGNnwYbtnkX/+rg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=YJUzyVIsqrBJuYf/dhHzLOA6G4j0mza51dqZRPhpAFc3kRwyAtyLUuWM6esptilOU
	 h6qg37KM7ptcvBuu3opOHCAMVX+2671XelosjiCXudez1jru7M6mxo6eShdosNSxsM
	 FbWosP4qht1wYKcU39fumoo8CEMkMMAYLhMzudQ4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KADivi057445
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 May 2020 05:13:44 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 05:13:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 05:13:44 -0500
Received: from [10.0.2.15] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KADibP129256;
	Wed, 20 May 2020 05:13:44 -0500
Subject: Re: [meta-arm] External toolchain support
To: Denys Dmytriyenko <denis@denix.org>, Paul Barker <pbarker@konsulko.com>
CC: <meta-arm@lists.yoctoproject.org>
References: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
 <20200520051816.GB17660@denix.org>
From: "William Mills" <wmills@ti.com>
Message-ID: <caf41e6e-6ff6-a07c-8585-7a5350d9d0b5@ti.com>
Date: Wed, 20 May 2020 06:13:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520051816.GB17660@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys/Paul,

On 5/20/20 1:18 AM, Denys Dmytriyenko wrote:
> Hi, Paul,
> 
> We have had an extensive discussion on this topic over on irc earlier today. 
> Yet, I see you went ahead with your rant without any of the clarifications we 
> disucssed on irc. If it is all about simply bashing external toolchains, as 
> Ross suggested, then knock yourself out - I won't mind as long as you don't 
> drag me into it... :) Thanks.
> 
> Denys
> 


It would be great if any clarifications actually made it to the list
here.  My reading of the below does not come off as bashing to me.
meta-arm should be usable w/o meta-ti or meta-arago and our integration
scripts.  If there are inaccuracies in the below I would like to know
what they are.

> 
> On Tue, May 19, 2020 at 09:03:53PM +0100, Paul Barker wrote:
>> Hi all,
>>
>> As discussed on the Yocto Project call today it's great to see the ARM
>> toolchain recipes moving forward under the new meta-arm layers. I've
>> had some issues in the past with the external pre-built toolchain
>> which really need fixing to properly integrate this toolchain into
>> projects. I'm raising them here in the hopes that these can now be
>> fixed.
>>
>> 1) Maintaining GPL compliance while using an external toolchain
>>
>> The Yocto Project has an archiver class which can be used to collect
>> the source code of all packages built by bitbake which is a
>> requirement for meeting the terms of the GPL. However for the external
>> toolchain recipes the "source" is the pre-built toolchain archive
>> downloaded from the ARM website. As the pre-built toolchain includes
>> glibc (which is then distributed as part of the images we build) what
>> we need is the actual source code used to build the various toolchain
>> components.
>>
>> The toolchain recipe needs to include some link to the actual upstream
>> sources and the archiver class in oe-core probably needs extending to
>> support this.
>>
>> 2) Building an SDK/ESDK
>>
>> If an SDK is generated for an image built with the pre-built toolchain
>> then there can be some confusion about what exactly should provide the
>> gcc binary and various headers. In the past I've had to hack
>> components out of the SDK after it is built and then tell customers to
>> install the pre-built toolchain alongside the SDK in order to get a
>> working cross-compiler. Ideally everything should actually get
>> packaged into the SDK so that only one download is needed and no
>> hard-coded paths are used.
>>
>> Additionally, running the populate_sdk task often fails due to missing
>> packages (libatomic-dev right now) and it looks like the recipe
>> bitrots fairly quickly after each fix. SDK generation needs to be
>> regularly tested and it needs to be confirmed that these SDKs can
>> actually cross-compile working binaries.
>>
>> 3) Toolchain recipe is effectively split between meta-arm & meta-arago layers
>>
>> The bbappends carried in meta-arago fix items which are missing from
>> the external-arm-toolcahin recipe in meta-arg (e.g. the installation
>> of the ldconfig binary). That effectively splits the recipe over
>> multiple layers as these things are pretty fundamental parts of the
>> external-arm-toolchain recipe. An effort needs to be made to merge all
>> this together and have the base recipe well tested.
>>
>> 4) No example configurations or visible test matrix
>>
>> The meta-arm-toolchain layer lacks a README or other file providing
>> some examples of working build configurations which use the pre-built
>> toolchain. It's unclear which MACHINEs and DISTROs are regularly
>> tested and are well supported. The best way to solve this would be to
>> actually store the test scripts and configurations in this layer and
>> use a publicly visible CI system like Travis, GitLab CI, etc to run
>> the tests. That would increase confidence in the pre-built toolchain
>> and make it clear what is supported and how frequently it's tested.
>>
>> 5) LICENSE is incorrectly stated in the external-arm-toolchain recipe
>>
>> The full license of the toolchain package needs to be specified. Right
>> now all packages are marked as having the MIT license which is
>> obviously not correct for most of them.
>>
>> Apologies for the long rant but I hope this is useful to highlight
>> some of the issues seen when trying to practically use the pre-built
>> ARM toolchain.
>>
>> Thanks,
>>
>> -- 
>> Paul Barker
>> Konsulko Group
> 
>>
> 
> 
> 
> 
