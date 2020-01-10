Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.239.1578678676684777039
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2020 09:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JVzADL79;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id 21so2640258qky.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2020 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8Jn8AFW11Mgx6+Td1EZWLNw5CM44c0w3UOX9N9IY33I=;
        b=JVzADL798Agt7Pi189eEsdn9xovHiawSQOdJpcebObAHHbu/7wJywsCVU5VzbtkMe0
         Esha27niLbP63jAmf7TgjpjYGGlG1t1GVPz9Vp6/SC/xPO+MCJsuZpnSJH6x6QWl549r
         LxsMNCzu+twSllm/5SzQ0U5PwQWBktZjCxGLp+k3FV7tMFP1INv1DgOaFP2j28Jp/2bm
         Ij2Asg53IJYky2XYy1WuD+CXkFJt8MjQ05C26SLHDOgymNyBVGKtabidS+FVfLFYiSxJ
         AlZXbMjjaj0LNHLd0eS7hrc0uwM+110JMWw/l8fBbThfEX2HEGla0PvXY2UsEt1+b3QF
         yOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8Jn8AFW11Mgx6+Td1EZWLNw5CM44c0w3UOX9N9IY33I=;
        b=LjQh9Sbl70XZyKl8/zGyA4EucNC+kQej7SnzOkPOYMSi1H46upY2kAKZwvcQLWLGAi
         CU3VWhxMPqPMESC5a79I1FRQDMVSMxutnW/J9A0tOdWzZTlhTuyRVXvyzC6BNZ+Zg23F
         uQIX2/gXmT7yDuihM+kdTIhsBs4fkukYpxb9V0DJ+MIk6V3G67LV1/tUkk6QOLrCZMMv
         gNlHnt24WAV8gtY2ET0o1I/fXzSEJ/k+rVDUP0LptFCtPHkPI82g3P+LRg5DNH/QIcqZ
         3bIIBBy4gsM6a+6lQ+q3knCpSkXiyEnIrFPp+JGsjI74U3dJc/hxD5MUgNP6Ae6gFk2W
         xx4A==
X-Gm-Message-State: APjAAAVrQUkakkHMbvcLw5Vk2lZpE7W1N2sPCFsXLKh5GJSnRKGnjTn6
	Q1U8AYmO2ZLP/rKssL6Vg3zqGVVW7V2HldgHYuc=
X-Google-Smtp-Source: APXvYqz5cdobtrZ7AYJ1eDoXzf3gPmlLOoPryDKN5u3Ugs1Rcy6fJ+TBJ4sfH+S+idVbw3zqhZSLfSqs+g37G4p05HQ=
X-Received: by 2002:a05:620a:6b8:: with SMTP id i24mr4501153qkh.9.1578678675549;
 Fri, 10 Jan 2020 09:51:15 -0800 (PST)
MIME-Version: 1.0
References: <f328d6db-3432-7b9b-2981-3bb18aa0b857@arm.com> <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
 <CAMKF1sqDm=6b_DDGLFRDkc96jS1tokbGN=az2svQmnfd7+t1gA@mail.gmail.com> <CAP71WjwiAViFWPC4cRvsCuFjfAVU5Lvn58c3i=zu9UVV9cSAPg@mail.gmail.com>
In-Reply-To: <CAP71WjwiAViFWPC4cRvsCuFjfAVU5Lvn58c3i=zu9UVV9cSAPg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 10 Jan 2020 09:50:49 -0800
Message-ID: <CAMKF1spJ_1q14fftqWZetk0dQYErw1yONKsvwsTSqKU27yNBTw@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm layer update
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Peter Griffin <peter.griffin@linaro.org>, 
	Fathi Boudra <fathi.boudra@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2020 at 9:05 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> khem,
>
> On Fri, Jan 10, 2020 at 5:41 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Nico and Jon
> >
> > I think the current layer is a jumbo layer and it has
> >
> > - A machine layer
> > - A Distro layer
> > - A Generic recipes layer
>
> meta-arm (the top level) is a layer collection. is that what you are
> complaining about? e.g. would you rather have each individual layer in
> their own tree? During initial review I insisted on having multiple
> layers for each purpose, for sure.. but I thought having a layer
> collection would still be ok.

Generally, if it was multiple similar kind of layers then it works ok
as its easy but having
machine, and distro in same layer might be different, Since distro
layers also come with
there workspace setup methods e.g. gitsubmods, android repo etc.
We have to run YP compliance on each layer separately anyway.

>
> >
> > I think mixing this way it going to be not crisp. Perhaps, iota can
> > use poky-tiny
> >
> > Thanks
> > -Khem
> > On Fri, Jan 10, 2020 at 12:33 AM Nicolas Dechesne
> > <nicolas.dechesne@linaro.org> wrote:
> > >
> > > hi Jon!
> > >
> > > On Tue, Jan 7, 2020 at 11:35 PM Jon Mason <jon.mason@arm.com> wrote:
> > > >
> > > > The meta-arm layer is now publicly available at
> > > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> > > >
> > > > It is still under active development, and I encourage everyone who=
 would
> > > > like to contribute to read
> > > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/README.md
> > >
> > > many thanks for starting this effort!
> > >
> > > Some initial comments/thoughts:
> > >
> > > 1. We are interested in moving the OP-TEE recipes that we've
> > > maintained in meta-linaro for quite some time, over there. We will b=
e
> > > looking into that soon.
> > > 2. I have very quickly browsed through the files, and noticed that y=
ou
> > > are setting DISTRO_FEATURES within machine configuration meta data
> > > (juno.conf), this really needs to be removed, as it's a bad practice=
.
> > > If someone builds their own distro/apps for 'juno' you shouldn't
> > > change their distro config.
> > > 3. We have some juno machine definition in meta-96boards, and we
> > > should look at cleaning things up a bit to avoid duplication
> > >
> > > >
> > > >
> > > > Also, some of the layers are now present on the OpenEmbedded layer
> > > > index.  Specifically,
> > > > http://layers.openembedded.org/layerindex/branch/master/layer/meta=
-arm-bsp/
> > > > http://layers.openembedded.org/layerindex/branch/master/layer/meta=
-arm/
> > > >
> > > > The meta-arm-iota layer was rejected due to not having a distro
> > > > definition in it, and generally being empty.  I will attempt to ad=
d it
> > > > again once code has been pushed to that location.
> > > >
> > > >
> > > > Thanks,
> > > > Jon
> > > > IMPORTANT NOTICE: The contents of this email and any attachments a=
re confidential and may also be privileged. If you are not the intended rec=
ipient, please notify the sender immediately and do not disclose the conten=
ts to any other person, use it for any purpose, or store or copy the inform=
ation in any medium. Thank you.
> > > >=20
