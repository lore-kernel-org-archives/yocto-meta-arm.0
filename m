Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DABC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 20:12:03 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.5913.1680293513245866085
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 31 Mar 2023 13:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=oqiOYga2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id o44so17215252qvo.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 13:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680293512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1h8xuLqCWvWFCRUJTon58wK8mHvpY115QPBUhAd4hCk=;
        b=oqiOYga2+Og8u83MweGZCXOiI1wUJOC1gDKem2TGJW524r9q6RkMFC6VJsWyq2rc+V
         /3iHGkSRiAsVYh3K1GIA7gj+yvzAH8Gq8F/hCg7s1osKDAtpPEiAmNkL0XUUypveTUCm
         2Nb2zG8j0TE8mWRt7ZTb93ttUJOINRMTBLELsFfSM4nkFlpMMeUCBrVhzg+rSJZp94hn
         uwZfg9ZsO8tqPqjumkwlNtEmgwqPkpO7F/fsjTq5ttlN5+oEc1TxldoUSWFgQmXWG9e4
         k9P66SjgeU7iQVpG4Nl7QGkcp52STZGF01Cf3+v+aC+S8uJK51y1Kb1o5GuhV0wGe7fH
         /L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680293512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1h8xuLqCWvWFCRUJTon58wK8mHvpY115QPBUhAd4hCk=;
        b=Mybe2c1perrf3s3tDU22rV5+ZgIbMseusJlMPfKrG51dvAT0wzCzWCu0Q1HgI3BI+U
         8HKm1Du2lEN9waO8Cm+LX98T1TLww+UoL+9wi1x1x8qJ8AnxcVJ3qWTye53G2o6ac0qi
         j9YJSytA0aVIS3N6wFbTxUgi9dSGuM7ACTKe2WzdskR0Xrrk6iF0mVS9QAHxe0A/KTOm
         jiEj+iPTgkKI2IkONHPcnTk4W0HyiVNF7WtNzblOsyPwZHYRr7ixbIu9I5HKwKc08mil
         AYHQ+YE8H0+hA38MGO4Xx4lA5AigiXzbPpNQHSkguiUiJuvNPYx3A4IjRl260SLbjTx9
         dcJQ==
X-Gm-Message-State: AAQBX9ckpn6RxLFSu3nUC2yHYt4RpT6okPMbaWpK6hYtPJmBatiaObCu
	aPoyzivhqkXAQeCvEIpMnngUcA==
X-Google-Smtp-Source: AKy350bQjFFkn5GmHhmTR4WV39ZT+ddf4HNUezOKbyZ1WT2o+JI/kzUZDq1Z7i8ooNOQ/sPD5dYvxg==
X-Received: by 2002:a05:6214:d6a:b0:5a6:ecda:bd8d with SMTP id 10-20020a0562140d6a00b005a6ecdabd8dmr54062916qvs.4.1680293512315;
        Fri, 31 Mar 2023 13:11:52 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id p11-20020a05620a22ab00b00706b09b16fasm909130qkh.11.2023.03.31.13.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 13:11:51 -0700 (PDT)
Date: Fri, 31 Mar 2023 16:11:50 -0400
From: Jon Mason <jdmason@kudzu.us>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/2] arm/lib: pass the PATH to fvp runner
Message-ID: <ZCc+hl2ITkjYNdxA@kudzu.us>
References: <20230329120057.58949-1-peron.clem@gmail.com>
 <ZCZM88HRz0zDSqUk@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCZM88HRz0zDSqUk@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 20:12:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4528

On Thu, Mar 30, 2023 at 11:01:07PM -0400, Jon Mason wrote:
> On Wed, Mar 29, 2023 at 02:00:56PM +0200, Cl�ment P�ron wrote:
> > When running an FVP machine the model executable need to be found
> > in the PATH environement.
> > 
> > At the moment the script doesn't provide any PATH to the subprocess.
> > 
> > Add PATH to the allowed environement variable to be forwaded.
> > 
> > Signed-off-by: Cl�ment P�ron <peron.clem@gmail.com>
> 
> This patch doesn't apply cleanly to the master branch.  I think it's
> as simple as appending to the list of variables passed to the
> environment, but I'll leave it to you to confirm and test.

I attempted to update but it fails selftest
Anyway, it might be a starting point for you
https://gitlab.com/jonmason00/meta-arm/-/commits/master-next2

> 
> Thanks,
> Jon
> 
> > ---
> >  meta-arm/lib/fvp/runner.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> > index 28351a39..40ad1f3c 100644
> > --- a/meta-arm/lib/fvp/runner.py
> > +++ b/meta-arm/lib/fvp/runner.py
> > @@ -63,7 +63,7 @@ class FVPRunner:
> >          # Pass through environment variables needed for GUI applications, such
> >          # as xterm, to work.
> >          env = config['env']
> > -        for name in ('DISPLAY', 'WAYLAND_DISPLAY'):
> > +        for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY'):
> >              if name in os.environ:
> >                  env[name] = os.environ[name]
> >  
> > -- 
> > 2.34.1
> > 
> > 
> 

