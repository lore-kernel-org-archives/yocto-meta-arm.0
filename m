Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.8976.1589882633404106902
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 03:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YAkIMSPn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: wmills@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04JA3gh0058900;
	Tue, 19 May 2020 05:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589882622;
	bh=Ig0mEmBBud2oaPqaqG0JhIX6FV0Xzf8oJCGyEaIhdfY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=YAkIMSPnctqKqf/nj+XPPImgASlDuon2hO5dt9lX8Uke8PoP3cYPAhLM48s4dUr+C
	 V7kqh/zzQISDQES31V08vRpCqqsBmcwQXO0ryCPw7xGz/IZAEmhzIa0McaK8fhCs5e
	 0t59GBQ15uEsQlxWrXyui5aqGTYSJsujL9Lkb3Vg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04JA3g7o066736;
	Tue, 19 May 2020 05:03:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 19
 May 2020 05:03:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 19 May 2020 05:03:42 -0500
Received: from [10.0.2.15] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04JA3fDS070826;
	Tue, 19 May 2020 05:03:41 -0500
Subject: Re: [meta-arm][PATCH v2 2/3] optee-client: Add sysVinit service
To: Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>
CC: <meta-arm@lists.yoctoproject.org>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>
 <20200515160240.16395-3-JPEWhacker@gmail.com>
 <20200517164423.GJ11927@denix.org>
 <450fe96c-56f2-f392-b719-3fd30bf458df@ti.com>
 <2530da10-ae67-3f05-8afb-f3130cb9510c@gmail.com>
 <20200518185843.GM11927@denix.org>
 <09567703-1e04-ee36-f6a8-f8a60b10592b@ti.com>
 <7c1ad105-4850-aced-26a4-61dd6e8c52b4@gmail.com>
 <20200518224148.GO11927@denix.org>
From: "William Mills" <wmills@ti.com>
Message-ID: <341c040b-67d2-7e71-d101-0764273d6cd1@ti.com>
Date: Tue, 19 May 2020 06:03:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518224148.GO11927@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/18/20 6:41 PM, Denys Dmytriyenko wrote:
> On Mon, May 18, 2020 at 05:06:48PM -0500, Joshua Watt wrote:
>>
>> On 5/18/20 4:57 PM, William Mills wrote:
>>>
>>> On 5/18/20 2:58 PM, Denys Dmytriyenko wrote:
>>>> On Mon, May 18, 2020 at 01:03:01PM -0500, Joshua Watt wrote:
>>>>> On 5/18/20 12:04 PM, William Mills wrote:
>>>>>> On 5/17/20 12:44 PM, Denys Dmytriyenko wrote:
>>>>>>> On Fri, May 15, 2020 at 11:02:39AM -0500, Joshua Watt wrote:
>>>>>>>> Adds a sysVinit service to start tee-supplicant so that the optee-client
>>>>>>>> package can be used on distros where systemd is not used. Also does some
>>>>>>>> cleanup of the recipe including:
>>>>>>>>  1) Using @path@ tokens for replacemane in the .service file instead of
>>>>>>>>     paths
>>>>>>>>  2) Replacing tokens in the .service file after it is installed instead
>>>>>>>>     of editing the source file in ${WORKDIR}
>>>>>>> Overall looks fine. Quick question - if both sysvinit and systemd are in
>>>>>>> DISTRO_FEATURES - will it start tee-supplicant twice? This was never clear
>>>>>>> to me - I see some recipes go the extra mile to check the DISTRO_FEATURES
>>>>>>> and only install/enable the service accordingly, while some completely rely
>>>>>>> on the corresponding bbclass.
>>>>>>>
>>>>>> I had to look into this on ubuntu/debian recently.
>>>>>> systemd's sysvinit emulation will skip any sysvinit script that has the
>>>>>> same name as a *.service file.
>>>>>>
>>>>>> From [1]:
>>>>>> """
>>>>>> systemd-sysv-generator generates the service units that run the van
>>>>>> Smoorenburg rc scripts from /etc/init.d, if it doesn't find a native
>>>>>> systemd service unit by that name already existing in the other six
>>>>>> locations.
>>>>>> """
>>>>>>
>>>>>> I don't know if that is systemd default or Debian enhancement but OE
>>>>>> should follow that rule if it does not already IMHO.
>>>>> systemd.bbclass and update-rc.d.bbclass work together to do the
>>>>> correct things based on the existence of the "sysvinit" and
>>>>> "systemd" DISTRO_FEATURES, so its fine to include both in a recipe.
>>>> So, if both are included and have the same name, systemd will skip the
>>>> sysvinit emulation and load the correct service only once, correct?
>>>>
>>>>
>>> Yes that is my understanding of how it works at run time, at least on
>>> debian.  Even if the user was to hand create both an sysinit script and
>>> a service file with the same basename, systemd will ignore the script in
>>> favor of the service file.  (sysvinit has know how to ignore service
>>> files since the 1970's :)
>>>
>>> Joshua: is what you are talking about in the classes a runtime selection
>>> or a rootfs build time selection?  Perhaps we are double covered?
>>
>> Build time. systemd.bbclass sets INHIBIT_UPDATERCD_BBCLASS = "1" if
>> "systemd" is in DISTRO_FEATURES and "sysvinit" is not,
>> update-rc.d.bbclass does nothing if that is set, and setting
>> INIT_MANAGER = "systemd" removes(*) "sysvinit" from DISTRO_FEATURES
>> and adds "systemd", so it pretty much automatically prefers the
>> systemd service files if possible.
>>
>> * Well, sets DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
> 
> Yeah, well, INIT_MANAGER is a simplification short-cut that is meant to setup 
> bunch of VIRTUAL-RUNTIME variables and ensure some sane defaults. It only 
> handles cases of systemd OR sysvinit OR mdev.
> 
> One can still go a more advanced route and set VIRTUAL-RUNTIME variables 
> directly and have both systemd AND sysvinit enabled in DISTRO_FEATURES. There 
> are (or maybe were) some specific use-cases that required systemd init-manager 
> enabled alongside fallback sysvinit scripts, because "systemd-compat-units" 
> was not enough. Maybe because of the recipes I mentioned that check for 
> "sysvinit" in DISTRO_FEATURES to even install correcponding initscripts.
> 
> Hence my question (and I believe, Bill's comments also) were regarding 
> run-time support of such cases...
> 

Here is the code:
https://github.com/systemd/systemd/blob/master/src/sysv-generator/sysv-generator.c#L778

...
    r = unit_file_exists(UNIT_FILE_SYSTEM, lp, name);
    if (r < 0 && !IN_SET(r, -ELOOP, -ERFKILL, -EADDRNOTAVAIL)) {
        log_debug_errno(r, "Failed to detect whether %s exists,
skipping: %m", name);
        continue;
    } else if (r != 0) {
        log_debug("Native unit for %s already exists, skipping.", name);
        continue;
    }
...

So upstream systemd does ignore sysvinit scripts with the same name as a
service file.

That file also verifies other things in that stack exchange answer like
systemd looks at rc{1,2,3,4,5}.d and runs scripts if enabled in any.
It looks at all scripts in /etc/init.d but only uses them if referenced
in one of the rcN.d's above.  The name compared for console-setup.sh
will be "console-setup".

It also ignores rc{S,0,6}.d and the K* files in rc{1,2,3,4,5}.

Bill
