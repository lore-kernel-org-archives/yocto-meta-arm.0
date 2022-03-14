Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED618C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 00:54:27 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.21590.1647219266342761726
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 13 Mar 2022 17:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=iOn5dfxA;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.98] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 42F7520B9C38;
	Sun, 13 Mar 2022 17:54:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 42F7520B9C38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1647219265;
	bh=c0irsDHSntjjBdm+5n7liheBV0ApoD8Sf0HUTZ7VxTY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iOn5dfxAML8eT5WFfqu98jM422qB2hl06aIQ2btxpY+dXRsUyyfMWvfWHJp5a+rxe
	 C2WaIjI8KPDXJInHgB1qcGZTvW9RD75VUdBO6UgsNhO450PynMACVfLMLoMZXYraGH
	 5aplUW3mqKd6Zyt75vdwaT+1ABkwVFUCW8/N2mq4=
Content-Type: multipart/alternative;
 boundary="------------9BLpOgVInJadtBJ0e7bBuopI"
Message-ID: <162704a2-46b2-f44a-187f-d982cc02123b@linux.microsoft.com>
Date: Sun, 13 Mar 2022 18:54:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [meta-arm] [PATCH] arm/optee: Upgrade from 3.14 to 3.16
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tim Orling <ticotimo@gmail.com>
Cc: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Denys Dmytriyenko <denis@denix.org>, Drew Reed <Drew.Reed@arm.com>,
 Jon Mason <jdmason@kudzu.us>, Maxim Uvarov <maxim.uvarov@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Sumit Garg
 <sumit.garg@linaro.org>, Vishnu Banavath <Vishnu.Banavath@arm.com>,
 "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
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
 <f91a66b2-53da-4ba9-dc20-3d2b4d590206@linux.microsoft.com>
 <571898ed-d0f4-a7c6-9559-4a125baf7c38@linux.microsoft.com>
 <CANx9H-A5DxwqX50dX1Ln14r7Ci_JTwGWXeQWQ2Gg3MfrcOKUyg@mail.gmail.com>
 <ae6d4ed4ab31810631fd311956d9675c48f5284e.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
In-Reply-To: 
 <ae6d4ed4ab31810631fd311956d9675c48f5284e.camel@linuxfoundation.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 14 Mar 2022 00:54:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3169

This is a multi-part message in MIME format.
--------------9BLpOgVInJadtBJ0e7bBuopI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks Tim and Richard!, I'll send a v2 soon based off on those changes.

Cheers,

Alejandro

On 3/13/22 11:17, Richard Purdie wrote:
> On Sat, 2022-03-12 at 14:02 -0800, Tim Orling wrote:
>> On Thu, Mar 10, 2022 at 9:12 AM Alejandro Hernandez Samaniego
>> <alhe@linux.microsoft.com>  wrote:
>>> Quick update before sending v2, the list of required dependencies to =
bring
>>> python3-cryptography is the following:
>>> recipes:
>>> python3-asn1crypto_1.4.0.bb
>>> python3-cffi_1.15.0.bb
>>> python3-cryptography
>>> python3-cryptography_36.0.1.bb
>>> python3-cryptography-vectors_36.0.1.bb
>>> python3-pycparser_2.21.bb
>>> python3-semantic-version_2.9.0.bb
>>> python3-setuptools-rust-native_1.1.2.bb
>>> python3-typing-extensions_3.10.0.0.bb
>>> classes:
>>> pyo3.bbclass
>>> setuptools3_rust.bbclass
>>>
>>
>> The full story (only missing a couple recipes added to ptest because I=
 don=E2=80=99t
>> know if they are slow or fast)
>> https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/move-py-crypto
> I've tweaked the series a bit and it is now in master-next.
>
> I've renamed the classes to add a python_ prefix which will mean we nee=
d to
> tweak recipes a little but I think it is the right thing to do and best=
 done now
> rather than any later.
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3168):https://lists.yoctoproject.org/g/meta-arm/mes=
sage/3168
> Mute This Topic:https://lists.yoctoproject.org/mt/89404067/4354175
> Group Owner:meta-arm+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-arm/unsub  [alhe@linu=
x.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------9BLpOgVInJadtBJ0e7bBuopI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <pre>Thanks Tim and Richard!, I'll send a v2 soon based off on those =
changes.</pre>
    <pre>Cheers,
</pre>
    <pre>Alejandro
</pre>
    <div class=3D"moz-cite-prefix">On 3/13/22 11:17, Richard Purdie wrote=
:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:ae6d4ed4ab31810631fd311956d9675c48f5284e.camel@linuxfoundatio=
n.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Sat, 2022-03-12 at 14:02 =
-0800, Tim Orling wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
On Thu, Mar 10, 2022 at 9:12 AM Alejandro Hernandez Samaniego
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alhe@linux.microsoft.co=
m">&lt;alhe@linux.microsoft.com&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">Quick update before send=
ing v2, the list of required dependencies to bring
python3-cryptography is the following:
recipes:
python3-asn1crypto_1.4.0.bb
python3-cffi_1.15.0.bb
python3-cryptography
python3-cryptography_36.0.1.bb
python3-cryptography-vectors_36.0.1.bb
python3-pycparser_2.21.bb
python3-semantic-version_2.9.0.bb
python3-setuptools-rust-native_1.1.2.bb
python3-typing-extensions_3.10.0.0.bb
classes:
pyo3.bbclass
setuptools3_rust.bbclass

</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">

The full story (only missing a couple recipes added to ptest because I do=
n=E2=80=99t
know if they are slow or fast)
<a class=3D"moz-txt-link-freetext" href=3D"https://git.yoctoproject.org/p=
oky-contrib/log/?h=3Dtimo/move-py-crypto">https://git.yoctoproject.org/po=
ky-contrib/log/?h=3Dtimo/move-py-crypto</a>
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I've tweaked the series a bit and it is now in master-next.

I've renamed the classes to add a python_ prefix which will mean we need =
to
tweak recipes a little but I think it is the right thing to do and best d=
one now
rather than any later.

Cheers,

Richard


</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#3168): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.yoctoproject.org/g/meta-arm/message/3168">https://lists.yoctop=
roject.org/g/meta-arm/message/3168</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.yoctoproject.org/mt/89404067/4354175">https://lists.yoctoproject.org/mt/=
89404067/4354175</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ar=
m+owner@lists.yoctoproject.org">meta-arm+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.yoc=
toproject.org/g/meta-arm/unsub">https://lists.yoctoproject.org/g/meta-arm=
/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:alhe@lin=
ux.microsoft.com">alhe@linux.microsoft.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------9BLpOgVInJadtBJ0e7bBuopI--

