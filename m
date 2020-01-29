Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.4226.1580303663813853453
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 05:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=j5RIyWCu;
 spf=pass (domain: linaro.org, ip: 209.85.208.196, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-lj1-f196.google.com with SMTP id q8so14272923ljb.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2020 05:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nMLE2770dfVB99ST/siTPLyYuFWDUvRFct1D6A3JDf0=;
        b=j5RIyWCuKnGTmE/ZO5hwWyn2E9IE5ThpsFgv6izjy9C7zsxiqtKNetdr4LxzFOGqnB
         yGla3XLdhUl55Ib6OPOgqjp4V71y9WdKpv57n0bN30dyF4JnySasDPoq77kApuvicfK8
         0NWFPCq8aIRZSLK+yhhlSXbAb94drRkLT5Yoy4RXPB3Pi89MaoRUg2TXbvlgX8VBonS/
         n9DdqMEmJVe77ddTRx9HOzyIlBXDc+VYKsHyrrrq0nzr9ebpb3Q+7F7iH+2QdR5QKe0K
         pzQsafbcPpkD2bgc54ZCmiqrC/eSCwfuZbUGyesy1mtLQS92NbZBl0vl9eiw87mXBV1H
         7Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nMLE2770dfVB99ST/siTPLyYuFWDUvRFct1D6A3JDf0=;
        b=TEDYCB/b+urvHk7AbhX7buvDqPuojKN9C18z5qwGw5ENXRgpIWqtwaaQMk7Uud9V2n
         LWe8ihN02Uukvk3jHM+Jx1kWYOdU3H4isDXzD0bL9AzhDnMl/chOiPmcQYzUj3Dah27P
         isg1UPBH0KpX3FIFb8H8/G2A+KngaixH/921sXgFE3r7HYIJj7YNq48/pKGZkWBvqyGa
         rcnLVvMjzL6ILI2kyUGpo6ca8ldGr9EcJ45eovfnMp+J54S66WVDQQrCPfIl5I/afz+a
         /ORaBRm6gwN6Cjhzc5uKq+0LRzkLOXeT5aGIoAy4Jj1DKAwbGM/Mhj8K9nv5gw2cx8jq
         0Kbg==
X-Gm-Message-State: APjAAAXAM2PHi5pw+fdV4QbTVn/4H8oCZqauZDiwlGZxnVGCdHeXtsBZ
	K8y9eW411uXWzq3PNeBmz6V6QiNcOXWaSdz5S7SvVpDGntU=
X-Google-Smtp-Source: APXvYqz1AqV4T6eODXTNiPUQEgSseMPG5rl2QiW3hO80wFXSipmVRXvpOlOLK6Dg5XR35/dR0jUSY9Bf7aONew1DID0=
X-Received: by 2002:a2e:9985:: with SMTP id w5mr7989673lji.268.1580303661464;
 Wed, 29 Jan 2020 05:14:21 -0800 (PST)
MIME-Version: 1.0
References: <1580124007-23324-1-git-send-email-sumit.garg@linaro.org>
 <20200128045355.GK4735@denix.org> <CAPoiz9zvPps4ZfkgOwFKEKcKUCdbAov5x9F4+GNfgQ1v5r5YhA@mail.gmail.com>
 <20200128212006.GM4735@denix.org> <CAP71WjzGOUJZbtuJKkgBDnibyvgntmxvXM6LgsFeoQqxh5g0Nw@mail.gmail.com>
 <20200128224954.GN4735@denix.org>
In-Reply-To: <20200128224954.GN4735@denix.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 29 Jan 2020 14:14:09 +0100
Message-ID: <CAP71Wjx=thhTHJotwoQ=o3wN9PS9-UTbtaH2hy=t2xnsrrEZJw@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] Import ARM GNU-A toolset recipes from meta-linaro
To: meta-arm@lists.yoctoproject.org, Peter Griffin <peter.griffin@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 11:50 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Jan 28, 2020 at 11:28:45PM +0100, Nicolas Dechesne wrote:
> > Le mar. 28 janv. 2020 =C3=A0 22:20, Denys Dmytriyenko <denis@denix.org=
> a =C3=A9crit :
> >
> > > On Tue, Jan 28, 2020 at 04:06:17PM -0500, Jon Mason wrote:
> > > > On Mon, Jan 27, 2020 at 11:54 PM Denys Dmytriyenko <denis@denix.or=
g>
> > > wrote:
> > > > >
> > > > > On Mon, Jan 27, 2020 at 04:50:07PM +0530, Sumit Garg wrote:
> > > > > > Add a new meta-arm-toolchain layer to hold ARM GNU-A toolset r=
ecipes
> > > > > > imported from meta-linaro tree, branch: master and commit ID:
> > > > > > 504ca3b217c9602b10eda0ec8a9f1055b59e482f.
> > > > > >
> > > > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > >
> > > > > It's an exact copy of what's currently in meta-linaro-toolchain,=
 but I
> > > still
> > > > > decided to test it - I applied this patch to meta-arm and reconf=
igured
> > > my
> > > > > setup by replacing meta-linaro-toolchain with the new
> > > meta-arm-toolchain and
> > > > > ran few builds that use external-arm-toolchain and gcc-arm recip=
es:
> > > > >
> > > > > Tested-by: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Thank you for the patch, Sumit, and for testing, Denys.  It is now
> > > > included in meta-arm, see
> > > >
> > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/?id=3Dc0a=
59f3d94c633d6c902e7bd436690bc890bbc40
> > >
> > > Thank you, Jon!
> > >
> > > Now I only need OP-TEE recipes migrated (Nico?) - I wonder if meta-o=
ptee
> > > sublayer is required like it's in meta-linaro/meta-optee[1], or just
> > > adding
> > > them into main meta-arm sublayer would be fine?
> >
> >
> > I think it should go into meta-arm directly. I don=E2=80=99t think add=
ing too many
> > layers is the right approach. We need to make sure that meta-arm remai=
ns a
> > generic software layer (no machine, no distro) so that it can easilt b=
e
> > consumed, so arguably we might not even need meta-arm-toolchain neithe=
r...
>
> I tend to agree regarding placing OPTEE in the main meta-arm layer, espe=
cially
> since it is now officially part of the Trusted Firmware project.
>
> When do you expect the patches out? Do you need help with that?

Pete is looking into that now, i suppose he will send patches soon,
hopefully you can help with the review!

>
> As of meta-arm-toolchain, it's not so clear - I'd prefer it in a separat=
e
> layer, many people get confused by additional toolchain configs and reci=
pes :)

I agree that toolchain is not as simple.. anyways, it's done as a
separate layer for now, so let's keep it this way..

>
> --
> Denys
>
>
> > > [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/
> > >
> > > --
> > > Denys
> > >
>=20
