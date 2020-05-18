Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1192.1589821501277382927
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 May 2020 10:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N8XHS9Se;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: wmills@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04IH4tt3066900;
	Mon, 18 May 2020 12:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589821495;
	bh=FCur559kKzdaRI0tGwuUFO9gHk5t8IONnp9PBbE/k1c=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=N8XHS9Ser/uaGrRLbtMjbBa3fQWy2X4HHfHN9vjCr0lGbgElfQdUm/x8P7Z43UOp1
	 5ghfZZMEi71VDVuPSJKIVDwnUE+egm4pQ2cMuaZJnrnEi7qDwmtkVgGhOAGuhEmMtL
	 zFUifre25U5TuytbaJP5oOj0s2zBb6TNeFsHnC6k=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04IH4ts7019853
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 May 2020 12:04:55 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 18
 May 2020 12:04:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 18 May 2020 12:04:55 -0500
Received: from [10.0.2.15] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04IH4sZi014170;
	Mon, 18 May 2020 12:04:55 -0500
Subject: Re: [meta-arm][PATCH v2 2/3] optee-client: Add sysVinit service
To: Denys Dmytriyenko <denis@denix.org>, Joshua Watt <JPEWhacker@gmail.com>
CC: <meta-arm@lists.yoctoproject.org>
References: <20200513221134.30072-1-JPEWhacker@gmail.com>
 <20200515160240.16395-1-JPEWhacker@gmail.com>
 <20200515160240.16395-3-JPEWhacker@gmail.com>
 <20200517164423.GJ11927@denix.org>
From: "William Mills" <wmills@ti.com>
Message-ID: <450fe96c-56f2-f392-b719-3fd30bf458df@ti.com>
Date: Mon, 18 May 2020 13:04:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200517164423.GJ11927@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/20 12:44 PM, Denys Dmytriyenko wrote:
> On Fri, May 15, 2020 at 11:02:39AM -0500, Joshua Watt wrote:
>> Adds a sysVinit service to start tee-supplicant so that the optee-client
>> package can be used on distros where systemd is not used. Also does some
>> cleanup of the recipe including:
>>  1) Using @path@ tokens for replacemane in the .service file instead of
>>     paths
>>  2) Replacing tokens in the .service file after it is installed instead
>>     of editing the source file in ${WORKDIR}
> 
> Overall looks fine. Quick question - if both sysvinit and systemd are in 
> DISTRO_FEATURES - will it start tee-supplicant twice? This was never clear 
> to me - I see some recipes go the extra mile to check the DISTRO_FEATURES 
> and only install/enable the service accordingly, while some completely rely 
> on the corresponding bbclass.
> 

I had to look into this on ubuntu/debian recently.
systemd's sysvinit emulation will skip any sysvinit script that has the
same name as a *.service file.

From [1]:
"""
systemd-sysv-generator generates the service units that run the van
Smoorenburg rc scripts from /etc/init.d, if it doesn't find a native
systemd service unit by that name already existing in the other six
locations.
"""

I don't know if that is systemd default or Debian enhancement but OE
should follow that rule if it does not already IMHO.

This is not clear in the man pages [2][3].

[1]
https://unix.stackexchange.com/questions/233468/how-does-systemd-use-etc-init-d-scripts

[2]
http://manpages.ubuntu.com/manpages/bionic/man8/systemd-sysv-generator.8.html

[3]
https://www.freedesktop.org/software/systemd/man/systemd-sysv-generator.html

Bill
