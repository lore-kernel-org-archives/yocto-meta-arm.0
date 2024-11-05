Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCB2D1CA3A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 06:40:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.12071.1730788839025330548
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Nov 2024 22:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=Liv4cTu9;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.208.47, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c9634c9160so5745550a12.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 04 Nov 2024 22:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1730788837; x=1731393637; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8GZ/H0f4mazIFYhSxUl9tOHe9pD0haEZeR+gtcjk3eo=;
        b=Liv4cTu9rhaoTlmh8Ny/OYopq2EqHl/wDFUMTCJnS6JZ/W7g/IZX6n2ODz41dibp+R
         Fr27bdNCxJu9cwPR4XY/MBXbszO0oIyxJCqiana0jrCI0ymKOkh6pqhVeQgpJkJyNGoA
         fnvPDRHawHNnBT3KB5tKjbf30AHe2HgoVIFge2FWgmIySm+ZTiMxKLb23hFqtH0I1mSR
         fSBOgcQ8dbfCPgb5aiTJuWy/5Vnv5AxO0K5sFBf9kzlUTJw0jLZfGAn+W4ZndIhwKqtL
         0xOxAmkF/Cmypp+7z9dxq+I8ZPgLuOixs5bfG0J3ahiSPu8948kxzLMJ/NEhvbpTb/sR
         WOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730788837; x=1731393637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GZ/H0f4mazIFYhSxUl9tOHe9pD0haEZeR+gtcjk3eo=;
        b=DW+zCw5NQp4c9aZdDu/Af8KSByruGnseGEAN3r8p4qrGHCws6SUqOzgBD8yqinUmqM
         EE/FPgozdU02AEPtz91KuN8uAPh2lgxEKTMcYnIPRFaH+AbCVamqItH+c4zlO1OTzMH5
         xZZEWFPhjUPmfU8/4Z7fzu0Ve2UnhjjbP8blvRdD/Bt6g14BmgYtLr9teRegGqFzQIzb
         iT5WCzBUJTutAGlyI7/KaKEsn03onLYlVWaaRk4D+eUiMCNd1ZEXlxkq2CkZCaVHEROV
         0z00J5KgivH/2c9WdyGRG16B98IpNkyV1AU/BcV2ra0CsHM1YI0h8SyW1i1zJbWf9857
         /+Ig==
X-Gm-Message-State: AOJu0Yz9U2ffR57KQvP5d4PaO26yIkww6LCPostW3hArtBPaXASTy/Tb
	8rfAxWT0Ksf0yj8sF1/Yt3WFDQSRBdRiP2uBDRUindv7r9sJJR1CDQP87TZX906RSvCmE9SOcCV
	374M5o6iB4O1Z49E2Df2PQ7u0VjXU5+vnY0KJEg==
X-Google-Smtp-Source: AGHT+IGikDKC8HPLMPXK0S9v4P9UDwu04MxbgzZUJCUMAE2N4k+ey8nIopsqis5M9YJyX0rPDIKgdWDpm+3YygYC+NE=
X-Received: by 2002:a17:907:8686:b0:a9a:212d:4ecb with SMTP id
 a640c23a62f3a-a9de5d702eemr3602090666b.12.1730788837068; Mon, 04 Nov 2024
 22:40:37 -0800 (PST)
MIME-Version: 1.0
References: <CAJ_JLwP79oAaY4P-DXnqdfrdL7XQXjWtUriF9tzy1eEUCa0h0g@mail.gmail.com>
 <CAEt6NwpP+VcbUkLrdi8OHb-63kyOx9Lg9T8V9Cjc+pfdwjzQ1A@mail.gmail.com>
 <CAJ_JLwNh31=2T_-nXJWkMg7Te5BHZs1pqYB1eF_Ag_iKtYJ0Wg@mail.gmail.com> <CAJ_JLwOSY9NnmqdU+tvy5KSFiSCPuCsk1=YL0fyBooP49oZwBg@mail.gmail.com>
In-Reply-To: <CAJ_JLwOSY9NnmqdU+tvy5KSFiSCPuCsk1=YL0fyBooP49oZwBg@mail.gmail.com>
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Tue, 5 Nov 2024 07:40:11 +0100
Message-ID: <CAEt6Nwqgvpge=ixjHYogu-Orrmek9=uX-g8ZnmsZabjVSGOMVw@mail.gmail.com>
Subject: Re: HDMI issue on odroid xu4
To: Userlove Kadli <userlovekadli@gmail.com>
Cc: meta-arm@lists.yoctoproject.org, meta-arm+help@lists.yoctoproject.org, 
	yocto-bsp+owner@lists.yoctoproject.org, 
	yocto-bsp+unsubscribe@lists.yoctoproject.org, 
	yocto-bsp+subscribe@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d0afb1062624adcc"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 05 Nov 2024 06:40:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6240

--000000000000d0afb1062624adcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please check the mail addresses, and read what I wrote. You're just
randomly addressing mailing list mechanisms. Stop spamming.

Greetz,,
Josef

On Mon, Nov 4, 2024 at 10:09=E2=80=AFAM Userlove Kadli <userlovekadli@gmail=
.com>
wrote:

> Hi,
> Greetings of the day !
>
> I have used the odroid-xu4 board (meta-odroid) in my embedded project and
> I have used the yocto project to build the custom linux for this board an=
d
> use Open source BSP(board support package) for this board. But i have bui=
lt
> the custom linux image and flash this image on this board and run this
> custom linux on this board but it does not show hdmi output.
> Suggest me how to solve this problem and enable hdmi feature in the board
> to see custom linux output in hdmi. Now i have used for working branch is
> kirkstone (LTS)(4.0)
>
> this is reference link for odroid xu4 BSP
> https://github.com/akuster/meta-odroid.git
>
> please help me yocto community to solve this issue
>
> With regards
> Arjun kumar
>
> On Mon, 4 Nov 2024 at 14:35, Userlove Kadli <userlovekadli@gmail.com>
> wrote:
>
>> Hi,
>> Greetings of the day !
>>
>> I have used the odroid-xu4 board (meta-odroid) in my embedded project an=
d
>> I have used the yocto project to build the custom linux for this board a=
nd
>> use Open source BSP(board support package) for this board. But i have bu=
ilt
>> the custom linux image and flash this image on this board and run this
>> custom linux on this board but it does not show hdmi output.
>> Suggest me how to solve this problem and enable hdmi feature in the boar=
d
>> to see custom linux output in hdmi. Now i have used for working branch i=
s
>> kirkstone (LTS)(4.0)
>>
>> this is reference link for odroid xu4 BSP
>> https://github.com/akuster/meta-odroid.git
>>
>> With regards
>> Arjun kumar
>>
>> On Mon, 4 Nov 2024 at 12:12, Josef Holzmayr <jester@theyoctojester.info>
>> wrote:
>>
>>> Hello!
>>>
>>> Thanks for reaching out. Please understand that neither of the addresse=
s
>>> you included provides technical support. For such, please see the maili=
ng
>>> lists and IRC channel as described at
>>> https://www.yoctoproject.org/community/get-involved/#mailing-lists. In
>>> case of questions on a specific layer, check the README file for the
>>> maintainers contact data.
>>>
>>> Greetz,
>>> Josef
>>>
>>> On Mon, Nov 4, 2024 at 6:21=E2=80=AFAM Userlove Kadli <userlovekadli@gm=
ail.com>
>>> wrote:
>>>
>>>> Hi,
>>>> Greetings of the day !
>>>>
>>>> I have used the odroid-xu4 board in my embedded project and I have use=
d
>>>> the yocto project to build the custom linux for this board and use Ope=
n
>>>> source BSP(board support package) for this board. But i have built the
>>>> custom linux image and flash this image on this board and run this
>>>> custom linux on this board but it does not show hdmi output.
>>>> Suggest me how to solve this problem and enable hdmi feature in the
>>>> board to see custom linux output in hdmi. Now i have used for working
>>>> branch is kirkstone (LTS)(4.0)
>>>>
>>>> this is reference link for odroid xu4 BSP
>>>> https://github.com/akuster/meta-odroid.git
>>>>
>>>> With regards
>>>> Arjun kumar
>>>>
>>>

--000000000000d0afb1062624adcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please check the mail addresses, and read what I wrote. Yo=
u&#39;re just randomly addressing mailing list mechanisms. Stop spamming.<d=
iv><br></div><div>Greetz,,</div><div>Josef</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 4, 2024 at 10:0=
9=E2=80=AFAM Userlove Kadli &lt;<a href=3D"mailto:userlovekadli@gmail.com">=
userlovekadli@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><span style=3D"color:rgb(80,0,80)">Hi,=C2=A0<br>Greetings of the d=
ay !<br><br></span>I have used the odroid-xu4 board (meta-odroid) in my emb=
edded project and I have used the yocto project to build the custom=C2=A0li=
nux for this board and use Open source BSP(board support package) for this =
board. But i have=C2=A0built the custom linux image and flash this image on=
 this board and run this custom=C2=A0linux on this board but it does not sh=
ow hdmi output.<span style=3D"color:rgb(80,0,80)"><div>Suggest me how to so=
lve this problem and enable hdmi feature in the board to see custom=C2=A0li=
nux output in hdmi. Now i have used for working branch is kirkstone (LTS)(4=
.0)<br><br>this is reference=C2=A0link for odroid xu4 BSP=C2=A0<br><a href=
=3D"https://github.com/akuster/meta-odroid.git" target=3D"_blank">https://g=
ithub.com/akuster/meta-odroid.git</a><br><br>please help me yocto community=
 to solve=C2=A0this issue=C2=A0<br><br>With=C2=A0regards</div><div>Arjun ku=
mar</div></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 4 Nov 2024 at 14:35, Userlove Kadli &lt;<a href=3D"=
mailto:userlovekadli@gmail.com" target=3D"_blank">userlovekadli@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-c=
olor:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,=C2=A0<br>Greet=
ings of the day !<br><br>I have used the odroid-xu4 board (meta-odroid) in =
my embedded project and I have used the yocto project to build the custom=
=C2=A0linux for this board and use Open source BSP(board support package) f=
or this board. But i have=C2=A0built the custom linux image and flash this =
image on this board and run this custom=C2=A0linux on this board but it doe=
s not show hdmi output.<div>Suggest me how to solve this problem and enable=
 hdmi feature in the board to see custom=C2=A0linux output in hdmi. Now i h=
ave used for working branch is kirkstone (LTS)(4.0)<br><br>this is referenc=
e=C2=A0link for odroid xu4 BSP=C2=A0<br><a href=3D"https://github.com/akust=
er/meta-odroid.git" target=3D"_blank">https://github.com/akuster/meta-odroi=
d.git</a><br><br>With=C2=A0regards</div><div>Arjun kumar</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 4 Nov=
 2024 at 12:12, Josef Holzmayr &lt;<a href=3D"mailto:jester@theyoctojester.=
info" target=3D"_blank">jester@theyoctojester.info</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr">Hello!<div><br></div><div>Thanks for reac=
hing out. Please understand that neither of the addresses you included prov=
ides technical support. For such, please see the mailing lists and IRC chan=
nel as described at=C2=A0<a href=3D"https://www.yoctoproject.org/community/=
get-involved/#mailing-lists" target=3D"_blank">https://www.yoctoproject.org=
/community/get-involved/#mailing-lists</a>. In case of questions on a speci=
fic layer, check the README file for the maintainers contact data.</div><di=
v><br></div><div>Greetz,</div><div>Josef</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 4, 2024 at 6:21=
=E2=80=AFAM Userlove Kadli &lt;<a href=3D"mailto:userlovekadli@gmail.com" t=
arget=3D"_blank">userlovekadli@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr">Hi,=C2=A0<br>Greetings of the day !<br><br>I have u=
sed the odroid-xu4 board in my embedded project and I have used the yocto p=
roject to build the custom=C2=A0linux for this board and use Open source BS=
P(board support package) for this board. But i have=C2=A0built the custom l=
inux image and flash this image on this board and run this custom=C2=A0linu=
x on this board but it does not show hdmi output.<div>Suggest me how to sol=
ve this problem and enable hdmi feature in the board to see custom=C2=A0lin=
ux output in hdmi. Now i have used for working branch is kirkstone (LTS)(4.=
0)<br><br>this is reference=C2=A0link for odroid xu4 BSP=C2=A0<br><a href=
=3D"https://github.com/akuster/meta-odroid.git" target=3D"_blank">https://g=
ithub.com/akuster/meta-odroid.git</a><br><br>With=C2=A0regards</div><div>Ar=
jun kumar</div></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000d0afb1062624adcc--

