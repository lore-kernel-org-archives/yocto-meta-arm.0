Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.12859.1578674504866092480
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2020 08:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LKuDE2Az;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id w47so2435788qtk.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2020 08:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yTeo1RJq7AhDm3qJvOaTsUR30sLrlFI8yrivjp6PK9o=;
        b=LKuDE2AzZk5j/c2JHUMZIm/bLpMCxbZaqbDQYOa9SBhBaC1qD5RGhcHJi4p94J7l1j
         i6IzCrUPKc1HIGPCTiYoZ9h0pkXrXErDUdYjs1Ef5rpsEoqC/HoVBTNe3o3DH3Z/utk2
         /2NFSVGHmzQDP2SYBO0KvNjBbbmHoweW2zvIlGH31QRDcguOfq8KUvx1Ob1jlFjRbbDT
         Y76ccfEUFanr2H4VidyLptcCDnvIde1kdbVWeqHQYuqTjBLaBSgYKzFE7fmXF6AoGxBn
         0V7CoDLhnBNmcfgTix6n4nB3wOGXTuKmBbdcJeTPudr3XSAiTxXjbZKO7sWvMsfOgRGL
         4CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yTeo1RJq7AhDm3qJvOaTsUR30sLrlFI8yrivjp6PK9o=;
        b=bRc+BqbWoAOZd0+BCSTwYsUzAD/8SbsTdUuvNNgcqPLhxXGInF7DuACq+jOypxqarv
         uQGFkirrWDfQImRPZvA2xUh2GpMtAjlMyQRaSUEhxylYJnyYDHX51cOn0nigVhxllJ2T
         2vVuew8WLl3hqeDop9fTkNGLLG2IBZqmODq6DhoirKMXxcS3JisvL7305iSrNlIdwDTz
         1d5R/IEBVnwOAzIdH40AKXMk6PAyfVDYz7b6SluqLaUHLhs9/1Hq2dy5mSixPAzJtrik
         +mow7hUU5nuR3N26SJfm6wbB+sbJ7jx1c0rB+6/0njpbZ4tvkr8bTqb59+fsomNs8uHQ
         gJnw==
X-Gm-Message-State: APjAAAV6aYi5RkhJN2Dw0lYqN6gE1UnGDY2E5hIIDWbT/+pPi+DNSEal
	fy3xh8O0xfxAI+PqToS6tlK/ncdzkrb6rR9sJwM=
X-Google-Smtp-Source: APXvYqwMWMIAxNdNEuIg3YOpSckF/cMwkiNlCG/V0yomoWyDyBOS9BuY32YrAgYGRqyclGetynk+3RYkXXKQ+GqKTl8=
X-Received: by 2002:aed:2c03:: with SMTP id f3mr3139797qtd.80.1578674503642;
 Fri, 10 Jan 2020 08:41:43 -0800 (PST)
MIME-Version: 1.0
References: <f328d6db-3432-7b9b-2981-3bb18aa0b857@arm.com> <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
In-Reply-To: <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 10 Jan 2020 08:41:16 -0800
Message-ID: <CAMKF1sqDm=6b_DDGLFRDkc96jS1tokbGN=az2svQmnfd7+t1gA@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm layer update
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Peter Griffin <peter.griffin@linaro.org>, 
	Fathi Boudra <fathi.boudra@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nico and Jon

I think the current layer is a jumbo layer and it has

- A machine layer
- A Distro layer
- A Generic recipes layer

I think mixing this way it going to be not crisp. Perhaps, iota can
use poky-tiny

Thanks
-Khem
On Fri, Jan 10, 2020 at 12:33 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> hi Jon!
>
> On Tue, Jan 7, 2020 at 11:35 PM Jon Mason <jon.mason@arm.com> wrote:
> >
> > The meta-arm layer is now publicly available at
> > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> >
> > It is still under active development, and I encourage everyone who wou=
ld
> > like to contribute to read
> > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/README.md
>
> many thanks for starting this effort!
>
> Some initial comments/thoughts:
>
> 1. We are interested in moving the OP-TEE recipes that we've
> maintained in meta-linaro for quite some time, over there. We will be
> looking into that soon.
> 2. I have very quickly browsed through the files, and noticed that you
> are setting DISTRO_FEATURES within machine configuration meta data
> (juno.conf), this really needs to be removed, as it's a bad practice.
> If someone builds their own distro/apps for 'juno' you shouldn't
> change their distro config.
> 3. We have some juno machine definition in meta-96boards, and we
> should look at cleaning things up a bit to avoid duplication
>
> >
> >
> > Also, some of the layers are now present on the OpenEmbedded layer
> > index.  Specifically,
> > http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm=
-bsp/
> > http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm=
/
> >
> > The meta-arm-iota layer was rejected due to not having a distro
> > definition in it, and generally being empty.  I will attempt to add it
> > again once code has been pushed to that location.
> >
> >
> > Thanks,
> > Jon
> > IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
> >=20
