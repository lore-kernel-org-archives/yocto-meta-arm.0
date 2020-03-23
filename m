Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.54280.1584974506899246312
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Mar 2020 07:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=azObRSZY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.65, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f65.google.com with SMTP id q128so14329685iof.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 23 Mar 2020 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BLQujPQ9rZ8sgEYux0LJ8bWT/gOEhXCRM6hpnSJtRuI=;
        b=azObRSZYfyP8vFLYrfipSwujXLJK8heqT8g+IKwZuXmF03keKO30AIcrO5HIPFm99u
         15/I+TWL9V8uXHGZ0DAe/8yVcFtbwL1oMKPW96BpypBeTbUvMOYi3szkeZ91nMshXpx8
         IUZ6Zs9wtZxQYYAnYFg7tTESN15ZeM3bS3QKPjLTlIHYYLsfEwXGXuZ3dln5Yt9mlJgF
         48fA8+JV0Fhp8v6Y7cxSqGQoUk+4SwPPlHsQ1zk81yq0jFUKhVpKQS6CF9uyIWrq5g2u
         EGeUMHWTiVqFKRzPrvIaySt+AS+zVGxWkaKLk3FtfsnYrJisyXHggGGUC6DCvcYVptG4
         EdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BLQujPQ9rZ8sgEYux0LJ8bWT/gOEhXCRM6hpnSJtRuI=;
        b=caaJGDPvRvxihbYPYf+jJ/AXO+R2GT6ybsNhw0ZYukJa5+pvCkB2Hq5mojm+bIEVxi
         Pfr4GRNJ5BsDSCey0qPmkmjk2+5VMz0Kt/FEwJZRkv1oPdVCv+p03OTaBegybKsYZtqL
         XWeuwcKj5Sf035/QTZa5x4wF7G58xVosZYD5zwhAPORndLRGYxFxGnWuSqXFlp9JgnD6
         x2eZ92jZQeNvvHpOFjh1zziL0isuLke2+nWwHnLgDqP2/in38A76HfhtECz8LIVsqfY/
         NccXl7m2an2LhZHBfzNnDnUHWjECucD8rLUwmO+za44gmubaAgmJmWerEH/GFezKjT9g
         GEdw==
X-Gm-Message-State: ANhLgQ3gh7zH3LzmGbZOmHnLVlQNk5qfq8Xz8lA4EcAceJyYV+CY3vQn
	KcJv2sMgMV4A+ur3n+tafT3p2XIc8iVQYy5FDmh6O0pDXiNGjg==
X-Google-Smtp-Source: ADFU+vuByIkNLsKsXZNDIteLaERvkDxks6P158eK9E9iDPLe+hveRDK6CqTnxFmLtJRJCVTm138bDKMV1xM4OY+U2Go=
X-Received: by 2002:a05:6602:164b:: with SMTP id y11mr6028704iow.3.1584974506096;
 Mon, 23 Mar 2020 07:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200323142146.30350-1-jon.mason@arm.com> <DF312761-3229-498A-8A74-7F95875AE6E8@arm.com>
In-Reply-To: <DF312761-3229-498A-8A74-7F95875AE6E8@arm.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Mon, 23 Mar 2020 10:41:35 -0400
Message-ID: <CAPoiz9zwDXOtLXi9SCw7ARthAcFf8f8mRmhOsMC2g1TPCzh+tQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH 1/2] meta-arm-bsp: a5ds: Remove WIC references
To: meta-arm@lists.yoctoproject.org
Cc: nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 23, 2020 at 10:27 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
>
>
> On 23 Mar 2020, at 14:21, Jon Mason via Lists.Yoctoproject.Org <jon.mason=arm.com@lists.yoctoproject.org> wrote:
>
> The current WIC references in the A5DS config file are causing a build
> break, due to not being defined.  These WIC files should be revisited
> once the IOTA distro is present.
>
> Change-Id: Ied2cd6f768625d18150ed60bd5fe317e06c7f48a
> Signed-off-by: Jon Mason <jon.mason@arm.com>
>
> Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks Bertrand.  I think you mean Reviewed-by though.  Per the Linux
kernel process (which I believe Yocto/OE follows):

From Documentation/SubmittingPatches

<snip>
Acked-by: is often used by the maintainer of the affected code when that
maintainer neither contributed to nor forwarded the patch.
</snip>

<snip>
Reviewed-by:, instead, indicates that the patch has been reviewed and found
acceptable according to the Reviewer's Statement:

        Reviewer's statement of oversight

        By offering my Reviewed-by: tag, I state that:

         (a) I have carried out a technical review of this patch to
             evaluate its appropriateness and readiness for inclusion into
             the mainline kernel.

         (b) Any problems, concerns, or questions relating to the patch
             have been communicated back to the submitter.  I am satisfied
             with the submitter's response to my comments.

         (c) While there may be things that could be improved with this
             submission, I believe that it is, at this time, (1) a
             worthwhile modification to the kernel, and (2) free of known
             issues which would argue against its inclusion.

         (d) While I have reviewed the patch and believe it to be sound, I
             do not (unless explicitly stated elsewhere) make any
             warranties or guarantees that it will achieve its stated
             purpose or function properly in any given situation.

A Reviewed-by tag is a statement of opinion that the patch is an
appropriate modification of the kernel without any remaining serious
technical issues.  Any interested reviewer (who has done the work) can
offer a Reviewed-by tag for a patch.  This tag serves to give credit to
reviewers and to inform maintainers of the degree of review which has been
done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
understand the subject area and to perform thorough reviews, will normally
increase the likelihood of your patch getting into the kernel.
</snip>

So in this case, probably the only "Acked-by" would be the author of
the original patch, Rui Silva.  Everyone else should do a Reviewed-by.

Thanks,
Jon

>
> ---
> meta-arm-bsp/conf/machine/a5ds.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
> index 136105b..fa7d88e 100644
> --- a/meta-arm-bsp/conf/machine/a5ds.conf
> +++ b/meta-arm-bsp/conf/machine/a5ds.conf
> @@ -14,7 +14,7 @@ EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
>
> SERIAL_CONSOLES = "115200;ttyAMA0"
>
> -IMAGE_FSTYPES += "tar.bz2 wic wic.nopt cpio.gz"
> +IMAGE_FSTYPES += "tar.bz2 cpio.gz"
>
> EXTRA_IMAGEDEPENDS += "u-boot"
>
> --
> 2.17.1
>
>
>
> 
