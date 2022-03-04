Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363FEC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 03:16:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.3243.1646363801961204796
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 19:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=hmVVahhc;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.8.233] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id C92E120B7178;
	Thu,  3 Mar 2022 19:16:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C92E120B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1646363801;
	bh=7/qYyZuRzZvWZT3YBgrSfYlbZ4jZ9aUgVFlo5C4aFrU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hmVVahhcZZLD0mBFo820ihdBw8+axzFYCUexlkmAe2gpPSX4vfdOt+02Yopgm0ggC
	 hphGJoogT3BiqD8kQtgeQf/fx6AowkAsBJDDAU+Zb09wHkmH2CJq39RkHqPdcFTUvS
	 6W7nZKnQs+YrcelQ/+Z75lcP7ZSmrJ16h5RXU2LE=
Content-Type: multipart/alternative;
 boundary="------------5CE30gf1mLdsG0T1pDrHiRJa"
Message-ID: <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
Date: Fri, 4 Mar 2022 03:16:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Sumit Garg <sumit.garg@linaro.org>, Jon Mason <jdmason@kudzu.us>,
 "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>,
 Vishnu Banavath <Vishnu.Banavath@arm.com>,
 Maxim Uvarov <maxim.uvarov@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Drew Reed <Drew.Reed@arm.com>
References: <20220226030441.2301940-1-alhe@linux.microsoft.com>
 <Yh5JYWMmAd6SnmOS@kudzu.us>
 <73a2bdd2-c8d1-9d96-df50-044d76bd4ff7@linux.microsoft.com>
 <Yh+DX8uaoS1VPpQ8@kudzu.us>
 <CAFA6WYMC1m18G_PaN07KTuavD3=8RYS4RoTUxGSiOsyePfZH1g@mail.gmail.com>
 <AM5PR0801MB17164CCA6910A06008AF914AFD049@AM5PR0801MB1716.eurprd08.prod.outlook.com>
 <5d1418bf-6879-237d-7bc7-e7a1ff0024b0@linux.microsoft.com>
 <20220303233749.GP1766@denix.org>
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <20220303233749.GP1766@denix.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Mar 2022 03:16:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3107

This is a multi-part message in MIME format.
--------------5CE30gf1mLdsG0T1pDrHiRJa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/3/22 23:37, Denys Dmytriyenko wrote:
> On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego wrote:
>> On 3/3/22 10:55, Abdellatif El Khlifi wrote:
>>> Hello,
>>>
>>> I suggest the following:
>>>
>>> In meta-arm-bsp/conf/layer.conf add :
>>>
>>> LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot = "
>>> meta-python openembedded-layer"
>>
>> This statement is a little confusing (to me), please correct me if
>> I'm wrong, but you're saying
>>
>> we should set a dependency from meta-arm-bsp layer, only for
>> qemuarm64-secureboot,
>>
>> however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,
>>
>> AFAIC meta-arm-bsp has now knowledge of its existence, in fact
>> there's no other mention of
>>
>> qemuarm64-secureboot in meta-arm-bsp.
> Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending on
> meta-arm, not meta-arm-bsp.
>
> Depending on python3-cryptography which is only available in meta-python (part
> of meta-openembedded) should be avoided. Back in the day we pushed for moving
> other python3 dependencies like pycryptodome and pyelftools into OE-Core:
>
> https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
> https://git.yoctoproject.org/meta-arm/commit/?id=f2069723f27d9229e8ec74263a41160c8df32571
>
> We could try doing the same with this new python3-cryptography dependecy and
> propose moving it to OE-Core. Alternatively, consider adding it to meta-arm?
> Not ideal, but meta-arm-bsp briefly carried alternative/older version recently:
>
> https://git.yoctoproject.org/meta-arm/commit/?id=a15c16068ab011e2ba91a6c4ca6e1251de0d8058

I agree with Denys's point here, I think its likely there's other cases just like
meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
it would make sense to add a copy of python3-cryptography to meta-arm (especially since
there's been similar situations in the past) and in parallel try to make a case for
python3-cryptography to be moved from meta-python to OE-core.

Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.

Alejandro

--------------5CE30gf1mLdsG0T1pDrHiRJa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/3/22 23:37, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220303233749.GP1766@denix.org">
      <pre class="moz-quote-pre" wrap="">On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 3/3/22 10:55, Abdellatif El Khlifi wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hello,

I suggest the following:

In meta-arm-bsp/conf/layer.conf add :

LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot = "
meta-python openembedded-layer"
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

This statement is a little confusing (to me), please correct me if
I'm wrong, but you're saying

we should set a dependency from meta-arm-bsp layer, only for
qemuarm64-secureboot,

however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,

AFAIC meta-arm-bsp has now knowledge of its existence, in fact
there's no other mention of

qemuarm64-secureboot in meta-arm-bsp.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending on 
meta-arm, not meta-arm-bsp.

Depending on python3-cryptography which is only available in meta-python (part 
of meta-openembedded) should be avoided. Back in the day we pushed for moving 
other python3 dependencies like pycryptodome and pyelftools into OE-Core:

<a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca">https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca</a>
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/meta-arm/commit/?id=f2069723f27d9229e8ec74263a41160c8df32571">https://git.yoctoproject.org/meta-arm/commit/?id=f2069723f27d9229e8ec74263a41160c8df32571</a>

We could try doing the same with this new python3-cryptography dependecy and 
propose moving it to OE-Core. Alternatively, consider adding it to meta-arm? 
Not ideal, but meta-arm-bsp briefly carried alternative/older version recently:

<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/meta-arm/commit/?id=a15c16068ab011e2ba91a6c4ca6e1251de0d8058">https://git.yoctoproject.org/meta-arm/commit/?id=a15c16068ab011e2ba91a6c4ca6e1251de0d8058</a></pre>
    </blockquote>
    <pre>I agree with Denys's point here, I think its likely there's other cases just like
meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
it would make sense to add a copy of python3-cryptography to meta-arm (especially since
there's been similar situations in the past) and in parallel try to make a case for
python3-cryptography to be moved from meta-python to OE-core.

Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.

Alejandro
</pre>
    <p>
    </p>
    <blockquote type="cite" cite="mid:20220303233749.GP1766@denix.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5CE30gf1mLdsG0T1pDrHiRJa--

