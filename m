Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A540C433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 01:05:27 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.4613.1646874325832088128
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 09 Mar 2022 17:05:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=rOIctnI2;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.8.145] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7D7B320B7178;
	Wed,  9 Mar 2022 17:05:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7D7B320B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1646874325;
	bh=hJ+dc6zWz9381LM3xYIIq7PlNVlMtOnkrLnVF3eKO+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rOIctnI2Sh0C78bNI1t31lRJhby35/yvrv266JyE7mr0occgJCYIHW1//hOkgdpqR
	 3qUj26cEq+h4x+UN1CVSpAVB7w860aXvgIB3YEMNRo9IU2XSaFNZIpJwdgdSoCkeIt
	 F0sH4Lzb08+jp1Ygsbk8bag1goAuQgC4Pk+JKI9U=
Content-Type: multipart/alternative;
 boundary="------------QMexNmoLBTc4s8zPNEOX0GSb"
Message-ID: <f91a66b2-53da-4ba9-dc20-3d2b4d590206@linux.microsoft.com>
Date: Wed, 9 Mar 2022 18:05:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>
Cc: Denys Dmytriyenko <denis@denix.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Sumit Garg <sumit.garg@linaro.org>,
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
 <07bd54fb-e4b4-6c95-5c8e-78074a3cc92e@linux.microsoft.com>
 <YikHhHc7RcwyEcua@kudzu.us>
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <YikHhHc7RcwyEcua@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Mar 2022 01:05:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3143

This is a multi-part message in MIME format.
--------------QMexNmoLBTc4s8zPNEOX0GSb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/9/22 13:01, Jon Mason wrote:
> On Fri, Mar 04, 2022 at 03:16:31AM +0000, Alejandro Hernandez wrote:
>> On 3/3/22 23:37, Denys Dmytriyenko wrote:
>>> On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego wrote:
>>>> On 3/3/22 10:55, Abdellatif El Khlifi wrote:
>>>>> Hello,
>>>>>
>>>>> I suggest the following:
>>>>>
>>>>> In meta-arm-bsp/conf/layer.conf add :
>>>>>
>>>>> LAYERDEPENDS_meta-arm-bsp:append:qemuarm64-secureboot = "
>>>>> meta-python openembedded-layer"
>>>> This statement is a little confusing (to me), please correct me if
>>>> I'm wrong, but you're saying
>>>>
>>>> we should set a dependency from meta-arm-bsp layer, only for
>>>> qemuarm64-secureboot,
>>>>
>>>> however, the qemuarm64-secureboot is part of meta-arm and not meta-arm-bsp,
>>>>
>>>> AFAIC meta-arm-bsp has now knowledge of its existence, in fact
>>>> there's no other mention of
>>>>
>>>> qemuarm64-secureboot in meta-arm-bsp.
>>> Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending on
>>> meta-arm, not meta-arm-bsp.
>>>
>>> Depending on python3-cryptography which is only available in meta-python (part
>>> of meta-openembedded) should be avoided. Back in the day we pushed for moving
>>> other python3 dependencies like pycryptodome and pyelftools into OE-Core:
>>>
>>> https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
>>> https://git.yoctoproject.org/meta-arm/commit/?id=f2069723f27d9229e8ec74263a41160c8df32571
>>>
>>> We could try doing the same with this new python3-cryptography dependecy and
>>> propose moving it to OE-Core. Alternatively, consider adding it to meta-arm?
>>> Not ideal, but meta-arm-bsp briefly carried alternative/older version recently:
>>>
>>> https://git.yoctoproject.org/meta-arm/commit/?id=a15c16068ab011e2ba91a6c4ca6e1251de0d8058
>> I agree with Denys's point here, I think its likely there's other cases just like
>> meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
>> it would make sense to add a copy of python3-cryptography to meta-arm (especially since
>> there's been similar situations in the past) and in parallel try to make a case for
>> python3-cryptography to be moved from meta-python to OE-core.
>>
>> Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.
> This seems reasonable.  Can you rework your series to add this?  Also,
> we need to keep the older version of OPTEE for corstone1000 (for the
> kirkstone release).  So, if you can keep that around in v2, it would
> be appreciated.
>
> Thanks,
> Jon

Will do, I'll send a v2 soon.

Cheers,

Alejandro


>> Alejandro
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#3142):https://lists.yoctoproject.org/g/meta-arm/message/3142
>> Mute This Topic:https://lists.yoctoproject.org/mt/89404067/4354175
>> Group Owner:meta-arm+owner@lists.yoctoproject.org
>> Unsubscribe:https://lists.yoctoproject.org/g/meta-arm/unsub  [alhe@linux.microsoft.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------QMexNmoLBTc4s8zPNEOX0GSb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/9/22 13:01, Jon Mason wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YikHhHc7RcwyEcua@kudzu.us">
      <pre class="moz-quote-pre" wrap="">On Fri, Mar 04, 2022 at 03:16:31AM +0000, Alejandro Hernandez wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 3/3/22 23:37, Denys Dmytriyenko wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Mar 03, 2022 at 09:11:28PM +0000, Alejandro Hernandez Samaniego wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On 3/3/22 10:55, Abdellatif El Khlifi wrote:
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
          <pre class="moz-quote-pre" wrap="">Moreover, optee is used by other BSP layers (e.g. meta-ti) by depending on
meta-arm, not meta-arm-bsp.

Depending on python3-cryptography which is only available in meta-python (part
of meta-openembedded) should be avoided. Back in the day we pushed for moving
other python3 dependencies like pycryptodome and pyelftools into OE-Core:

<a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca">https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca</a>
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/meta-arm/commit/?id=f2069723f27d9229e8ec74263a41160c8df32571">https://git.yoctoproject.org/meta-arm/commit/?id=f2069723f27d9229e8ec74263a41160c8df32571</a>

We could try doing the same with this new python3-cryptography dependecy and
propose moving it to OE-Core. Alternatively, consider adding it to meta-arm?
Not ideal, but meta-arm-bsp briefly carried alternative/older version recently:

<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/meta-arm/commit/?id=a15c16068ab011e2ba91a6c4ca6e1251de0d8058">https://git.yoctoproject.org/meta-arm/commit/?id=a15c16068ab011e2ba91a6c4ca6e1251de0d8058</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I agree with Denys's point here, I think its likely there's other cases just like
meta-ti, and we would be forcing a meta-oe and meta-python dependency on them, IMO
it would make sense to add a copy of python3-cryptography to meta-arm (especially since
there's been similar situations in the past) and in parallel try to make a case for
python3-cryptography to be moved from meta-python to OE-core.

Once (and if) we're successful we can delete the python3-cyrptography copy from meta-arm.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This seems reasonable.  Can you rework your series to add this?  Also,
we need to keep the older version of OPTEE for corstone1000 (for the
kirkstone release).  So, if you can keep that around in v2, it would
be appreciated.

Thanks,
Jon
</pre>
    </blockquote>
    <pre>Will do, I'll send a v2 soon.</pre>
    <pre>Cheers,</pre>
    <pre>
</pre>
    <pre>Alejandro
</pre>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:YikHhHc7RcwyEcua@kudzu.us">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Alejandro
</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
        <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#3142): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-arm/message/3142">https://lists.yoctoproject.org/g/meta-arm/message/3142</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/89404067/4354175">https://lists.yoctoproject.org/mt/89404067/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-arm+owner@lists.yoctoproject.org">meta-arm+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-arm/unsub">https://lists.yoctoproject.org/g/meta-arm/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------QMexNmoLBTc4s8zPNEOX0GSb--

