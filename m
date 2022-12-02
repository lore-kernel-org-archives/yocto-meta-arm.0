Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA55C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 13:45:52 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.75429.1669988750439668177
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 05:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=rDb2VXAr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id h24so5070425qta.9
        for <meta-arm@lists.yoctoproject.org>; Fri, 02 Dec 2022 05:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oYt0w6Kkh2UojiVibtqWnE/Tnu6xQWQuTn0GLMe9u8A=;
        b=rDb2VXArJSI35aFNypGAuUz5Xrqbe7ZJ20jwjucIUGYuOTm7VZLEy7bVAlCuGpO634
         AtA4cIxf2B+dwQd9id25wnTtGnH/yEQMl6oxmpriPG0x6E+COwP1cTNfRmqW736pq79n
         AnV4g5gxjz4b8o9zFxYpKTKR4NUfxCnvPMua2wcgIl6lZUTDIYPA96WZ0lCXdUDYhXOM
         vnjOo+/nci2yo/NuMi/iSj6G8IbD3NmPhqNHrPVyMBSKYAxXAOKfbs0ZVGseDyEbEhjX
         77HbmiZX2S91FrR7Z5443rE7OPNu5NyQPdIiwELYdLXf7WjuSy8cxnyMeHZZNh47TsJQ
         UQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYt0w6Kkh2UojiVibtqWnE/Tnu6xQWQuTn0GLMe9u8A=;
        b=glZ0npRIGdL5VZ8XZYopTEsG/fdmJuwgh8ufljLKSJ9+x0wKeu/UxCRuxd1gkVzU2q
         2w4EJKExUPUGoqrOjbeZDvrRFeJFJAkvKwDXGK8L9Emx/2llMEavC29VO9IFUVZv8k82
         ygKZ29maH498Ckgd7HLjuN0b6WaoWGHby8L20fylhU8M0DA/AneyTcI7lI6dmLXzSagW
         13k6sdWh/ZkSwvaWdtQAWbtgxV8ohffX/729Twd6cEkSCvq2987FrYUpg50g4WI3pq9X
         3w/SOWH9LJseClur2/v90e0I2VyhpQhlbgC6n2aLffC2+K9DzzF+kIKu4qzL97io+j8p
         friQ==
X-Gm-Message-State: ANoB5pkwqyB4o7ic7294kFlrEEZ1D0rg7f6XA/zNUqKWR4sUFqvEOn/A
	LmcdxSO9/a3eMAL7LaYleCrHWg==
X-Google-Smtp-Source: AA0mqf46I17osY8sIW0Kgdm+KgGaSD+4Y72Zi03W9YXKKRi6kW/EtxoAP0ltuPXHXir2o6UrA+s0uw==
X-Received: by 2002:ae9:c217:0:b0:6fc:9203:83fd with SMTP id j23-20020ae9c217000000b006fc920383fdmr14295769qkg.167.1669988749208;
        Fri, 02 Dec 2022 05:45:49 -0800 (PST)
Received: from kudzu.us ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id bj18-20020a05620a191200b006ce0733caebsm5591305qkb.14.2022.12.02.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 05:45:48 -0800 (PST)
Date: Fri, 2 Dec 2022 08:45:46 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Peter Hoyes <Peter.Hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm/fvp: Backport shlex.join from Python 3.8
Message-ID: <Y4oBimhqtUm1reHi@kudzu.us>
References: <172CABFC67A33C02.1705@lists.yoctoproject.org>
 <bd626514-d654-c78d-140a-108ea7fd7153@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd626514-d654-c78d-140a-108ea7fd7153@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 02 Dec 2022 13:45:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4176

On Thu, Dec 01, 2022 at 12:46:08PM +0000, Peter Hoyes wrote:
> Please can this bug fix be backported to langdale

Done

> 
> On 01/12/2022 12:44, Peter Hoyes via lists.yoctoproject.org wrote:
> > From: Peter Hoyes <Peter.Hoyes@arm.com>
> > 
> > 721bec25 "arm/fvp: Join cli arguments in verbose logging" changed the
> > verbose output of FVPRunner to print the generated arguments using
> > shlex.join instead of as a list. However, this function is only
> > available in Python >= 3.8, whereas OE-core currently supports Python
> > 3.6.
> > 
> > To fix this, backport its one-line implementation to a local function
> > shlex_join and update the call site.
> > 
> > Issue-Id: SCM-5314
> > Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> > Change-Id: I56cab9dddcd0a91272464be15742a6ee726dad41
> > ---
> >   meta-arm/lib/fvp/runner.py | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> > index f55c579d..4fd624ba 100644
> > --- a/meta-arm/lib/fvp/runner.py
> > +++ b/meta-arm/lib/fvp/runner.py
> > @@ -70,6 +70,13 @@ class ConsolePortParser:
> >                   pass
> > +# This function is backported from Python 3.8. Remove it and replace call sites
> > +# with shlex.join once OE-core support for earlier Python versions is dropped.
> > +def shlex_join(split_command):
> > +    """Return a shell-escaped string from *split_command*."""
> > +    return ' '.join(shlex.quote(arg) for arg in split_command)
> > +
> > +
> >   class FVPRunner:
> >       def __init__(self, logger):
> >           self._logger = logger
> > @@ -88,7 +95,7 @@ class FVPRunner:
> >               if name in os.environ:
> >                   env[name] = os.environ[name]
> > -        self._logger.debug(f"Constructed FVP call: {shlex.join(cli)}")
> > +        self._logger.debug(f"Constructed FVP call: {shlex_join(cli)}")
> >           self._fvp_process = subprocess.Popen(
> >               cli,
> >               stdin=subprocess.DEVNULL, stdout=stdout, stderr=subprocess.STDOUT,
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#4172): https://lists.yoctoproject.org/g/meta-arm/message/4172
> > Mute This Topic: https://lists.yoctoproject.org/mt/95380444/5715260
> > Group Owner: meta-arm+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.hoyes@arm.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 

