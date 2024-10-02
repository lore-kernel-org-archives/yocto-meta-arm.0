Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C32CF31B9
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:07:54 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.6809.1727874469836774150
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 06:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=qJS6A1n+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.43, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2876ef56d8bso809205fac.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 02 Oct 2024 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727874469; x=1728479269; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBrFYrcoWRHEVL5FIP3T5/+9wQKMR6L231Ok6s+Nz9A=;
        b=qJS6A1n++qwrds99NVXqw3zQaac3/leMLn4eQTVs5JsfYCtdQfDgOo4pDoORLQNwdy
         ExFxYo2ubqpkPu53PJ0wvLw1mb1GpSfQy3vrYo4Q8kwqHty/EBy/P6rrb/I4Y43nc4pZ
         21hYcbiPS2dhQr5Jmk/N6pgwEZ1S1+aqX8sBNUJF72PxmI/JdKdKtB5GPC6OCDY+mNOn
         BRNp3U+S/srDt7DTcL9zkxbpqvQFijgoZSsL5Ft2uVEVv14l07Q55xDJuyGfcKfHGaJ/
         QA9MGZxAiTX9WI89OQgzWWu4pTGi4//zAQeGp/aUj4+S3zbwdW/9wvMCJxvVoXo4U0lp
         WZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874469; x=1728479269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBrFYrcoWRHEVL5FIP3T5/+9wQKMR6L231Ok6s+Nz9A=;
        b=dlLZurB4YXblJU6j9y8MaFvfYQDXGdprjQjuGIrbhpVFup2gl6rlNtlQYGDqjSIpXP
         0rT4dnZaKXllFiO/w9IRgskmuITQ9Q/3bmY/3fexKInjcQUJEHzs9pT1xVo20pgTjndJ
         JuC74D2NgVq94sFDJMzNB3MiqZub4fdhi3J+t/oRtAlwS7g8jPsc+xLnxbCAWzQVMf9A
         JrmyfOiqFhZ78CDjHUDSmBgLXbA0FrfI78+QMIKYXc+EgsxV0TlSwzaom1xsPFg3FhVU
         jEkOiSbgaMSJ+awMjc3rGQwh7ThrNiwzShU+g5nGjd/urs4Uzss+FSlicGGuMVtTwap8
         gG5A==
X-Forwarded-Encrypted: i=1; AJvYcCVoFNtRvySUaK/oD45d86r1af9F1qDqFKl4p/fXrgNDZj6y5r2T2VfKXrd2pPaD1H75xsOetQIuZQ==@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw9s9NMetJstoDbikYZgFxEnCYj8aMCYHX3t225PfmANVYSLUl1
	gFAvmUpRBsdmSLpPmKR3KBJuyFKoidis25VEKLQONcGKEk+cxmO0YveXXW7QUITABtENF4O7SH9
	qgdjdkVQ//DEAD8uPRG+S/7s/F/3dGOx3AB2E
X-Google-Smtp-Source: AGHT+IHNRNZQyZdhGp178OrhZ72kzMupwJSGmiOy+QCujKyiJB15VxTnBcWWXLM90FAPX2rXejqaDL+5iLbDGNhHqEM=
X-Received: by 2002:a05:6870:1609:b0:286:f74a:93cc with SMTP id
 586e51a60fabf-28788a0ac2bmr1878558fac.2.1727874468939; Wed, 02 Oct 2024
 06:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240928155436.1145975-1-radian.dc@gmail.com> <ZvqvFhYoRXQ9RQ4H@kudzu.us>
 <7afc0d4f-cf91-4750-93a3-3fc9c9a1b364@linaro.org> <CAPoiz9xr1DyEP-XWCRK_uhShDbb0kRrfcw8V8PL_CGwcCAP2PA@mail.gmail.com>
 <c5d876bf-2c3e-4fe2-8ebb-92dec0a0a3f5@gmail.com>
In-Reply-To: <c5d876bf-2c3e-4fe2-8ebb-92dec0a0a3f5@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 2 Oct 2024 09:07:38 -0400
Message-ID: <CAPoiz9wVJSHMz_5NaUz3ZrGdO9yYX95iKURsSob=7dVL2KcpQg@mail.gmail.com>
Subject: Re: [PATCH] trusted-firmware-a: fix build error when using ccache
To: Adrian DC <radian.dc@gmail.com>
Cc: Javier Tia <javier.tia@linaro.org>, meta-arm@lists.yoctoproject.org, 
	Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Oct 2024 13:07:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6162

On Mon, Sep 30, 2024 at 9:56=E2=80=AFPM Adrian DC <radian.dc@gmail.com> wro=
te:
>
> Hi,
>
> Sorry I wasn't available to respond earlier.
>
> Apparently the details I added after the initial send got lost.
>
> - Original commit : nanbield and scarthgap (f2efb2a45610216cb6c2d72bdb5d5=
e61b990064a as you pointed out)
> - Missing on : kirkstone and mickledore
> - Tested on : kirkstone with CCache enabled
>
> The cherry-pick was over kirkstone, without any changes except validation=
 hence signoff (old Android System habits),
> proposal was to apply the fix on kirkstone (being LTS and used by most SO=
M providers for now).

No problem.  We only take patches for Yocto Project officially
supported releases.  See
https://wiki.yoctoproject.org/wiki/Releases

The logic behind this decision is:
1.  We don't want to give the false impression that we support or test
releases that are EOL'ed
2.  We don't want to encourage developers/users to use releases which
are no longer getting security updates
3.  Some of them are currently broken and upstream will not take
patches to fix this (broken download locations)

So, I'll only backport this to kirkstone.  Throwing at CI now to
verify it doesn't break anything.

Per Denys's comment, if you put the release you want this applied to
in the subject line, then I have scripts that automatically apply it
and run CI on it.

Thanks,
Jon


> Thanks for your concern,
>
> Adrian DC
>
>
> On 01/10/2024 01:02, Jon Mason wrote:
>
> On Mon, Sep 30, 2024 at 6:47=E2=80=AFPM Javier Tia <javier.tia@linaro.org=
> wrote:
>
> Hi,
>
> On 9/30/24 8:00 AM, Jon Mason wrote:
>
> On Sat, Sep 28, 2024 at 05:54:36PM +0200, Adrian DC wrote:
>
> From: Javier Tia <javier.tia@linaro.org>
>
> When ccache is enabled trusted-firmware-a recipe fails with this
> error message:
>
>      make: *** No rule to make target 'aarch64-poky-linux-gcc'. Stop.
>
> ccache prefix CC variable with 'ccache' word before compiler. Because
> there are no quotes assigned to CC, only 'ccache' is assigned. The
> compiler becomes a make target, producing the build error.
>
> Add single quotes to LD is a good measure to prevent this kind of error.
>
> Signed-off-by: Javier Tia <javier.tia@linaro.org>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> Signed-off-by: Adrian DC <radian.dc@gmail.com>
>
> I have questions about this patch's origins, given the above s-o-b's.
> Signed-off-by's state an authorship or handling (see Developer=E2=80=99s
> Certificate of Origin).  Since I have not seen this patch, I should
> not be listed.  It's on me to add my s-o-b.  Also, the ordering tends
> to matter, as each person handling the patch adds their s-o-b at the
> end of the patch.  So, you should be second, since you are taking this
> from Javier and submitting it for him (nd I would be last since
> I'mtaking it from you).
>
> Also, this feels like it needs a "Fixes:" line.  So, I know how far to
> pull this back in the stable branches.
>
> Finally, I find it weird that Javier isn't submitting this himself.
> Javier appears to be the author, and it includes his Linaro emaila
> ddress, and you are sending it from a gmail account.  Are you
> co-authors?  Are you sending it with his approval because he is
> busy/vacationing/ill?
>
> Overall the patch is fine and I would normally include it, but this is
> weird to me.  If Javier acks it to confirm his authoer, then I'll move
> my s-o-b to the end and include it.
>
> Oh, this is a surprise.
>
> Jon has a good point.
>
> I have not approved sending this patch on my behalf. Yes, it looks like I=
 am the original author because I recall fixing some issues around ccache a=
 time ago; maybe last year if I remember correctly. But, before I acked it,=
 I would like to know from where it was taken to have a bit more context. U=
RL? Was the patch accepted or rejected?
>
> I think I know what might've happened.  It's already in the tree
> (commit f2efb2a45610216cb6c2d72bdb5d5e61b990064a).
> I'm guessing that Adrian accidentally sent it to this list while
> trying to backport it to an older release.  I got overly concerned
> with the s-o-b lines and didn't think to check what it wasn't applying
> :)
>
> Anyway, I think we can disregard this.
>
> Thanks,
> Jon
>
>   >
>
> Jon
>
>
> ---
>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> index 2e3b50c5..5d3da59b 100644
> --- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> +++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
> @@ -101,9 +101,9 @@ def remove_options_tail (in_string):
>       from itertools import takewhile
>       return ' '.join(takewhile(lambda x: not x.startswith('-'), in_strin=
g.split(' ')))
>
> -EXTRA_OEMAKE +=3D "LD=3D${@remove_options_tail(d.getVar('LD'))}"
> +EXTRA_OEMAKE +=3D "LD=3D'${@remove_options_tail(d.getVar('LD'))}'"
>
> -EXTRA_OEMAKE +=3D "CC=3D${@remove_options_tail(d.getVar('CC'))}"
> +EXTRA_OEMAKE +=3D "CC=3D'${@remove_options_tail(d.getVar('CC'))}'"
>
>   # Verbose builds, no -Werror
>   EXTRA_OEMAKE +=3D "V=3D1 E=3D0"
> --
> 2.43.0
>
>
> Thanks,
>
> =C2=BB Javier Tia =F0=9F=96=8B
>
>

