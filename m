Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.995.1589839034760764107
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 14:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QBIbAYrm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: wmills@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04ILv7jM090826;
	Mon, 18 May 2020 16:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589839027;
	bh=HysQkaYZMYe+CNn8EgRCGwm+mXGz8mDb4nWzdztA4o8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=QBIbAYrmYkWNKvSHrTjwqppE66sxqOLs0TwCnB451LC60AXBFM7ngZdN1dSaO4TVl
	 9QyoWZ2x217qP3AU4o59BX6WGGTNaQd4NPMpF/vpjR4bSeZVoRFzahZS6mUyHyRjXr
	 L1lC6389YtfpU0TRoyfg7x6DIspUTcYggicwWIB4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04ILv7Eh099486;
	Mon, 18 May 2020 16:57:07 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 May 2020 16:57:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 May 2020 16:57:07 -0500
Received: from [10.0.2.15] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04ILv7T4127350;
	Mon, 18 May 2020 16:57:07 -0500
Subject: Re: [meta-arm][PATCH v2 2/3] optee-client: Add sysVinit service
To: Denys Dmytriyenko <denis@denix.org>, Joshua Watt <JPEWhacker@gmail.com>
CC: <meta-arm@lists.yoctoproject.org>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>
 <20200515160240.16395-3-JPEWhacker@gmail.com>
 <20200517164423.GJ11927@denix.org>
 <450fe96c-56f2-f392-b719-3fd30bf458df@ti.com>
 <2530da10-ae67-3f05-8afb-f3130cb9510c@gmail.com>
 <20200518185843.GM11927@denix.org>
From: "William Mills" <wmills@ti.com>
Message-ID: <09567703-1e04-ee36-f6a8-f8a60b10592b@ti.com>
Date: Mon, 18 May 2020 17:57:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518185843.GM11927@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/18/20 2:58 PM, Denys Dmytriyenko wrote:
> On Mon, May 18, 2020 at 01:03:01PM -0500, Joshua Watt wrote:
>>
>> On 5/18/20 12:04 PM, William Mills wrote:
>>>
>>> On 5/17/20 12:44 PM, Denys Dmytriyenko wrote:
>>>> On Fri, May 15, 2020 at 11:02:39AM -0500, Joshua Watt wrote:
>>>>> Adds a sysVinit service to start tee-supplicant so that the optee-client
>>>>> package can be used on distros where systemd is not used. Also does some
>>>>> cleanup of the recipe including:
>>>>>  1) Using @path@ tokens for replacemane in the .service file instead of
>>>>>     paths
>>>>>  2) Replacing tokens in the .service file after it is installed instead
>>>>>     of editing the source file in ${WORKDIR}
>>>> Overall looks fine. Quick question - if both sysvinit and systemd are in
>>>> DISTRO_FEATURES - will it start tee-supplicant twice? This was never clear
>>>> to me - I see some recipes go the extra mile to check the DISTRO_FEATURES
>>>> and only install/enable the service accordingly, while some completely rely
>>>> on the corresponding bbclass.
>>>>
>>> I had to look into this on ubuntu/debian recently.
>>> systemd's sysvinit emulation will skip any sysvinit script that has the
>>> same name as a *.service file.
>>>
>>> From [1]:
>>> """
>>> systemd-sysv-generator generates the service units that run the van
>>> Smoorenburg rc scripts from /etc/init.d, if it doesn't find a native
>>> systemd service unit by that name already existing in the other six
>>> locations.
>>> """
>>>
>>> I don't know if that is systemd default or Debian enhancement but OE
>>> should follow that rule if it does not already IMHO.
>>
>> systemd.bbclass and update-rc.d.bbclass work together to do the
>> correct things based on the existence of the "sysvinit" and
>> "systemd" DISTRO_FEATURES, so its fine to include both in a recipe.
> 
> So, if both are included and have the same name, systemd will skip the 
> sysvinit emulation and load the correct service only once, correct?
> 
> 

Yes that is my understanding of how it works at run time, at least on
debian.  Even if the user was to hand create both an sysinit script and
a service file with the same basename, systemd will ignore the script in
favor of the service file.  (sysvinit has know how to ignore service
files since the 1970's :)

Joshua: is what you are talking about in the classes a runtime selection
or a rootfs build time selection?  Perhaps we are double covered?

