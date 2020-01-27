Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.7724.1580124887176267739
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Jan 2020 03:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MZVFlxof;
 spf=pass (domain: linaro.org, ip: 209.85.208.194, mailfrom: sumit.garg@linaro.org)
Received: by mail-lj1-f194.google.com with SMTP id a13so10232867ljm.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 27 Jan 2020 03:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NRIuD0W5hWqDPfOCFXY70wcemeI0rG9+UrBOw8hnHTk=;
        b=MZVFlxofcrWXiFCl20n+8NeFjUZWvUSwEledbfWBoXibTWaF+Rdbw8ww+q8enVTI+T
         /ig+4CvwiRUO9KsPWe6wum9DA1F7fvyzhFIW7Eu51icvnrM/hTMN+uKHSnBDNJElHy87
         nxqQGX2iOxe81vpa1VXOn8C+10QynHqDvFkRASz6t0+56H4z1eJgMNZZoF/qv7BK3Xj8
         65c401edaXVaUkal/PDmojxm+0NoSPPYGqXHqsh1ytXiR6huLQpUB51DXUouo2P9w7Kj
         4ExfTDskC1kyogwJOni5nz0tvWkcNvIwb8TOm859YLBdsPRpc2FSZ4+GxH76rL1RXLmF
         EKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NRIuD0W5hWqDPfOCFXY70wcemeI0rG9+UrBOw8hnHTk=;
        b=lL4XyIUbTbRpoIVVt09t8gsqkz6J450V9DzKZhTG5MTdWgv8uEvQ/m3MfjybzylDUG
         z0AbNwbYenHqShgql22Ot4nUS2zA5iWVSAlZ6P1e6r9S+qKQE5isOZFaiQsDT2ecX0yN
         q4PH5EtmiupHhGvTaWKq1t1afM/YwW7EAalL2KuRyyCtBis9BQm1Fy0zLCITBS/8Uy1Q
         c5IOU+WYOmJtM9OnP/GsiS+LEgbfouJMfsbFLxTy3MBZhdxqnTidClwhAbBi2uyr14Wh
         oGXUj0IrRT7sytSysBJRVvuB2uZbpxjLJZVSJnBr9jutnJGyXsj2cdHbdN8cuaa9KjPq
         wviA==
X-Gm-Message-State: APjAAAXDGbgMJ6gMK3LmpxHyTNdNcMRCxlWCoEy/Xr8vu/HNRxPEwyq6
	/3gRULnxx7nCDAiped4WOsTacgkjHRP+7jVkr4Il0w==
X-Google-Smtp-Source: APXvYqyz7NBRJRbFt99nZXsgaYKkS0qkU2NkH+Rdz7yhZM4ZvverrGviQRU7RFuBq7Qu0YIu5OS55lC+hTg7+yZ+sr4=
X-Received: by 2002:a2e:9a51:: with SMTP id k17mr9287058ljj.206.1580124885169;
 Mon, 27 Jan 2020 03:34:45 -0800 (PST)
MIME-Version: 1.0
References: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
 <CAPoiz9w4u_s526ek1MONnpx934w2+K3zH4vU==0h-qR+SSq9YQ@mail.gmail.com>
In-Reply-To: <CAPoiz9w4u_s526ek1MONnpx934w2+K3zH4vU==0h-qR+SSq9YQ@mail.gmail.com>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Mon, 27 Jan 2020 17:04:33 +0530
Message-ID: <CAFA6WYOdtJdbpGu-TyEDtH50WQ9-9t0Zx4QA4ux09Srzz9eSFA@mail.gmail.com>
Subject: Re: [meta-arm] Proposal to import ARM GCC toolchain recipes into meta-arm
To: jon.mason@arm.com
Cc: Daniel Thompson <daniel.thompson@linaro.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>, meta-arm@lists.yoctoproject.org, 
	denis@denix.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 25 Jan 2020 at 02:35, Jon Mason <jdmason@kudzu.us> wrote:
>
> On Thu, Jan 23, 2020 at 5:39 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Hi Jon and all,
> >
> > As you may be aware that Linaro used to maintain meta-linaro-toolchain
> > layer [1] in meta-linaro tree for GCC tool-set releases from Linaro
> > till GCC 7.
> >
> > And since GCC 8, the tool-set release and maintenance work was
> > transferred to ARM. But meta-linaro-toolchain layer continued support
> > for ARM GCC tool-set releases as well.
> >
> > In future, I think meta-arm tree [2] shall be an appropriate place to
> > host ARM GCC toolchain recipes as an additional meta-arm-toolchain
> > layer. Also, with the latest integration [3] for ARM GCC 9.2 toolchain
> > in meta-linaro, recipes are well tested and seems to be stable. So I
> > would like to propose import of ARM GCC toolchain recipes into
> > meta-arm.
> >
> > I am looking forward to any comments or suggestions regarding this proposal.
>
> I am very much in favor of this and was working on a recipe to do this
> before the end of last year (but was not working and was not able to
> get back to it yet).  If you send emails to this mailing list with the
> relevant code, I'll happily pull them in.  Since this is already in
> the meta-linaro tree, I think the optics of you submitting it to
> meta-arm are better.  However, if you are busy with other things, I
> can pull all of the relevant recipes in from meta-linaro.  Just tell
> me which you prefer.

I have posted a patch [1] to this list in order to import ARM GNU-A
toolset recipes as new meta-arm-toolchain. Please have a look.

[1] https://lists.yoctoproject.org/g/meta-arm/topic/70151367

-Sumit

>
> Thanks,
> Jon
>
> > [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro-toolchain
> > [2] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> > [3] https://lists.yoctoproject.org/g/yocto/message/48094
> >
> > Regards,
> > Sumit
> >
> 
