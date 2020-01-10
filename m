Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web09.12947.1578674807056255446
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Jan 2020 08:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=XNmdtKuv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.193, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f193.google.com with SMTP id f10so2249182ils.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Jan 2020 08:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oYcTwENdfZwH4EArwp8VwxRnMJiWA8xYu7hnf+yhqYc=;
        b=XNmdtKuvBhfpnEgZioSgbBS4vXHRpfjGn8Xnjh2QbM8cU/J5w3NO6PM85XXfJy2dml
         r9w/btnx/2QWcGPoJIOwi52k7w1DUGd7HQlYSiNjR7eG35kFytVOlnjOGh+juBwqspwy
         ksnPKObjVakVI4ONy7OqIRkuTZ9KpyVA8Mjr6OGoiDE8lLiXYHEmb1olHHZypCDup18E
         UfLznMgHAex5yZZsIKJn5eLwZ+gJy7VtAJs/Uw3kNP2satTeNwI2ih0vv16uR9jbyqu1
         zIMX4ooiT/XsvtRzwJ4OpDCuQD6DjNOQ3CnjXco27ljJtykBTPj2DGjsT9EYoKGB5JAQ
         lDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oYcTwENdfZwH4EArwp8VwxRnMJiWA8xYu7hnf+yhqYc=;
        b=KMcjeolB/+K13ASezDNPbq29OT3N9mNl5pb+NFY0PeuWvcPCE3bR+iOKY5mUlqTH19
         NfRZ+m2iR+NhhDwgZzloFL94dDwENlTMuY6jvwcWMHc01E+QZOI+TIrpPcA61U5hEFbM
         Tj9yEz1foPO1VoSdbrN9LW7HI4U9ykfFFm5Goq+S58hXsCmA+BSD+aB3IZ4cgGDHr3Qy
         A9GenoKHHZf7TxmMUFVd5k/9K8vGBmBvkML24Lo2ifMenVjiXs8mKPAE6FxX2fuxv+0s
         RwxNunXRrxE+SPu1/XdIsWRyJNbyrh6tJumPu5LDj+r0PnGR1ab9bxdj+hiXVEHWEsuJ
         MtBw==
X-Gm-Message-State: APjAAAWhS8eJI8RaPdsf0ZCcqopJke6DVeKO09MWzprrAdWsUOGMRDl6
	pwYZvXpgauxdIeGKhWAlDUsI8dZzofyK2scaemWRdwN42Ww=
X-Google-Smtp-Source: APXvYqx4zmqmgIS/jZt+1EihmEi2IxOVoOcyb95dasJ0AM5CQubiWw01nU/1IQFdlsOBdIWQGVLP0E2dubdoZMrCQRc=
X-Received: by 2002:a92:770a:: with SMTP id s10mr3159872ilc.159.1578674806147;
 Fri, 10 Jan 2020 08:46:46 -0800 (PST)
MIME-Version: 1.0
References: <f328d6db-3432-7b9b-2981-3bb18aa0b857@arm.com> <CAP71Wjwxwxxzxn=4ErvE7C4mPa+UnhQQH_b+-13QLDxsTp4Lkg@mail.gmail.com>
 <CAMKF1sqDm=6b_DDGLFRDkc96jS1tokbGN=az2svQmnfd7+t1gA@mail.gmail.com>
In-Reply-To: <CAMKF1sqDm=6b_DDGLFRDkc96jS1tokbGN=az2svQmnfd7+t1gA@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Fri, 10 Jan 2020 11:46:33 -0500
Message-ID: <CAPoiz9ws3jkHCvvhpRbRmAn+MnWJuFJWBMphqFnf4Y1vVvFKXw@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm layer update
To: meta-arm@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Fathi Boudra <fathi.boudra@linaro.org>, Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2020 at 11:41 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Nico and Jon
>
> I think the current layer is a jumbo layer and it has
>
> - A machine layer
> - A Distro layer
> - A Generic recipes layer
>
> I think mixing this way it going to be not crisp. Perhaps, iota can
> use poky-tiny

Not sure I follow.  Is the problem that there are too many divergent
things in the jumbo layer or is it a potential problem with
meta-arm-iota?

Thanks,
Jon


>
> Thanks
> -Khem
> On Fri, Jan 10, 2020 at 12:33 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > hi Jon!
> >
> > On Tue, Jan 7, 2020 at 11:35 PM Jon Mason <jon.mason@arm.com> wrote:
> > >
> > > The meta-arm layer is now publicly available at
> > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> > >
> > > It is still under active development, and I encourage everyone who w=
ould
> > > like to contribute to read
> > > https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/README.md
> >
> > many thanks for starting this effort!
> >
> > Some initial comments/thoughts:
> >
> > 1. We are interested in moving the OP-TEE recipes that we've
> > maintained in meta-linaro for quite some time, over there. We will be
> > looking into that soon.
> > 2. I have very quickly browsed through the files, and noticed that you
> > are setting DISTRO_FEATURES within machine configuration meta data
> > (juno.conf), this really needs to be removed, as it's a bad practice.
> > If someone builds their own distro/apps for 'juno' you shouldn't
> > change their distro config.
> > 3. We have some juno machine definition in meta-96boards, and we
> > should look at cleaning things up a bit to avoid duplication
> >
> > >
> > >
> > > Also, some of the layers are now present on the OpenEmbedded layer
> > > index.  Specifically,
> > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-a=
rm-bsp/
> > > http://layers.openembedded.org/layerindex/branch/master/layer/meta-a=
rm/
> > >
> > > The meta-arm-iota layer was rejected due to not having a distro
> > > definition in it, and generally being empty.  I will attempt to add =
it
> > > again once code has been pushed to that location.
> > >
> > >
> > > Thanks,
> > > Jon
> > > IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
> > >
>=20
