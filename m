Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878FBC7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 09:27:41 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.84047.1684142859305441341
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 May 2023 02:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=URR4bz1o;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f24cfb8539so10807446e87.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 15 May 2023 02:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684142857; x=1686734857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbsIkSBvoUw9NTEBq9vc6P6AO6zUcaZgNDLKhDnLJmo=;
        b=URR4bz1oLkmLsa5gxpSyUQ085uoSrNHxpA19W/7WaCFuPpxW5xvLMSo+IU89MTEqNM
         9bUTg4Px2g6KbS5gurhwTbVtgbS8GDsJvg7Gn7ODWl4twO2qPRa5R5bPlbf4uvq4k90+
         533iuQSDBYxqlrQeLJV8RwWPIDzfRmxuuB4ItglugfC4P1824XhkyrpHLhmetaN0VOCV
         fQy7GjPtuBTp4JyIN4ur8LYIrkP7f5WtpmJpkoPGVfOGv7Lz+epFqnQTdfaqLykDQW0a
         bCl/4eriBqu4HMJpuJZyYr2TMoA1ElQu8htIz+4VbOEOprmLziEwLYbIyFP2f6jfr3Rk
         qfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684142857; x=1686734857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbsIkSBvoUw9NTEBq9vc6P6AO6zUcaZgNDLKhDnLJmo=;
        b=TAdEaC0XHQtEPjEbg/ZQiY5j+RNOQRkYUFEIFLK0sVv3YaSeASNlYoxMdZae6o5ohi
         TKsGvGo7xV4zKNOxqFSenUl3B3+Ehs5nha+ABWMDCaQSP2GOVc1NHO3RetOTtx442Q6j
         Ug+X8oYeEY9SdN3uStDS297raCZM728162YblucyxJAnfywfiv8P2GutDIJDRmAsvH3N
         bVWHy5xqM7ufFKaF7RlL7raUy6HvRhkx5eGFIYVv4U77/eTUZzJ1WtBM0yDb+hE3/F7e
         SZKRqqKQAEdpkEkHxjhso74hiMkrg8s3wMmhcsgVDb3apxVs+o+GiMwFHx15sNOpZfpv
         kDow==
X-Gm-Message-State: AC+VfDxCs1pENT+5OlZNg+UQVW1Y7inMpzljr9jxqBQNzbn8DXqvUyHL
	C3ZBJTo5jpukDP4ogNtbIyKaE9KJsVwC7BF1w3c=
X-Google-Smtp-Source: ACHHUZ7PP2b63+ysdQXCmfIGWjEmBcbjN9Y7AqRQsxbDpdVBrJiUlR3JwL8CySQ6nK1l5cNG48auicsKYff/DwyTjW4=
X-Received: by 2002:ac2:488c:0:b0:4f0:2ce:34ea with SMTP id
 x12-20020ac2488c000000b004f002ce34eamr5820634lfc.44.1684142856850; Mon, 15
 May 2023 02:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230511160116.398793-1-peron.clem@gmail.com> <7f861c0c-b98a-b9bb-b6fe-d53dd32c724b@arm.com>
In-Reply-To: <7f861c0c-b98a-b9bb-b6fe-d53dd32c724b@arm.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 15 May 2023 11:27:25 +0200
Message-ID: <CAJiuCcej=qKCg-ULE3GWHYsysApHDh7yJXTXwEsKQpvnBVKmKg@mail.gmail.com>
Subject: Re: [meta-arm] [RFC 1/2] runfvp: switch working directory to allow
 path relative to fvpconf
To: Peter Hoyes <Peter.Hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 May 2023 09:27:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4645

Hi Peter,

On Fri, 12 May 2023 at 16:19, Peter Hoyes <Peter.Hoyes@arm.com> wrote:
>
> Hi Clement,
>
> On 11/05/2023 17:01, Cl=C3=A9ment P=C3=A9ron via lists.yoctoproject.org w=
rote:
> > fvpconf file contains absolute path that leak builder path.
> >
> > Allow to add relative path by changing the chdir before loading
> > the config file.
>
> The fvpconf file is read by both runfvp and also a custom OE testimage
> controller [1] which we use heavily for runtime validation - I think
> these patches will break this use case.

Thanks for the review and the explanation,

So this will make the config read multiple times right? one time in
the caller and one time in the callee.

What about passing the conf working directory as a param of FVPRunner.start=
() ?

Something like this:
def start(self, fvpconf, extra_args=3D[], terminal_choice=3D"none",
stdout=3Dsubprocess.PIPE, fvp_cwd=3DNone):

Regards,
Clement


>
> It should be possible to set the 'cwd' argument of subprocess.Popen in
> the common code [2]. It might require another patch to move conffile
> loading into the common code though so that its filename is accessible...
>
> We also have an oe-selftest for this common code [3], which may need
> updating.
>
> [1]
> https://git.yoctoproject.org/meta-arm/tree/meta-arm/lib/oeqa/controllers/=
fvp.py
> [2]
> https://git.yoctoproject.org/meta-arm/tree/meta-arm/lib/fvp/runner.py#n99
> [3]
> https://git.yoctoproject.org/meta-arm/tree/meta-arm/lib/oeqa/selftest/cas=
es/runfvp.py
>
> Peter
>
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >   scripts/runfvp | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/scripts/runfvp b/scripts/runfvp
> > index e4b00abc..f0d821be 100755
> > --- a/scripts/runfvp
> > +++ b/scripts/runfvp
> > @@ -87,6 +87,12 @@ def runfvp(cli_args):
> >           config_file =3D args.config
> >       else:
> >           config_file =3D conffile.find(args.config)
> > +
> > +    # Path inside the config could be relative to the config file
> > +    working_directory =3D os.path.dirname(config_file)
> > +    logger.debug(f"Switching the working directory to {working_directo=
ry}")
> > +    os.chdir(working_directory)
> > +
> >       logger.debug(f"Loading {config_file}")
> >       config =3D conffile.load(config_file)
> >       start_fvp(args, config, extra_args)
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#4641): https://lists.yoctoproject.org/g/meta-arm/me=
ssage/4641
> > Mute This Topic: https://lists.yoctoproject.org/mt/98830760/5715260
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.hoy=
es@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

