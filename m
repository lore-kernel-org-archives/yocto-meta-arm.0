Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.864.1579900370505348286
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jan 2020 13:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TZRiUOW6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.171, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f171.google.com with SMTP id o13so2058721ilg.10
        for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jan 2020 13:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ToitqJ3rz3xSnmz3U63OWUQegmP/9IWIQ3rWSAt5vw0=;
        b=TZRiUOW6hUDgEG58yRBZIZkAXhSqzS81FyaOKHzSp9buWK9HjQ+RpCqpKEsxk5zOOB
         DvpgI4dQ5H7TzlGDAZmgFSUV2/7rOurmySXb+BNfXDFn0+EXyzPgqFg6zZsLEftq5178
         hV1FqPOxh/2ZBF4+KzP2nQx+3oo2LFhuJZJ39uy4SFTE0jkL7dr0vF3fJ6B6kJLht80I
         uUNIyrtLk4ejdkwgafU2DzfeAjBoM3mSlMXoxzrDsa4gWpQnZI8gpdFbfH/YMCfIc++k
         nTnMyGeVc8jt094vYr7hUPm2c3/RIh1CCpArTNc3Nln6AF2hRqNNbXEgDwLyqs0mlg83
         yXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ToitqJ3rz3xSnmz3U63OWUQegmP/9IWIQ3rWSAt5vw0=;
        b=G9HuECQQYFcujbYiQ2EKb8cLR8Z2P0WSoQkomDiFmfxlEw62zif3asr4Jb0HsyIHWT
         y+PZ/XlOO27S/9iMsBhRdLi0MhOpKuC9OXCS5FVBBYgLFvCXIbNJ4lPVPN7F/h2K53Dy
         9ky1C3Gjd8r0NaQk2BknpLj7ADIdKYVTq/IA4IDSuxdnxcBGEisAgA3t5RijFLSbE1F6
         CcqqWz+FpSbH6t2wVVt3dvcliE0Lty68BKnEWfHg/IzgAdmWw6k9RCEgERnw9P2jxbBr
         +BgFoFqPZ5bnTyJwx20kMUc9DjrdKetmul6AyQwwtEDVl+aMssACg2JY88JTEwFEp9jk
         T8EQ==
X-Gm-Message-State: APjAAAXLLtGH+OEcRt+Y3ZG2ELesOMzNiYacJRecag+rvL0PQWn4XLNg
	YMRNOlSp5Ro7plDe5nlw2y2LWaSkHmQTIuwJH5JSVXAYRms=
X-Google-Smtp-Source: APXvYqz28f/IWuec9PKI8xTmUuai51S0cYgyud7h+7KEpvqDebR6jp1iPIGfcxz6DJOhsZU0aCbzdtp8Dp/5YPoKjRs=
X-Received: by 2002:a92:1553:: with SMTP id v80mr5095732ilk.49.1579900369710;
 Fri, 24 Jan 2020 13:12:49 -0800 (PST)
MIME-Version: 1.0
References: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
 <12230.1579827059785197376@lists.yoctoproject.org> <CAFA6WYMXaNgRgAJ_mC-TSYqgRBvZkVD4Le=qu-p4s-wZb9h25Q@mail.gmail.com>
In-Reply-To: <CAFA6WYMXaNgRgAJ_mC-TSYqgRBvZkVD4Le=qu-p4s-wZb9h25Q@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Fri, 24 Jan 2020 16:12:39 -0500
Message-ID: <CAPoiz9zfipHK4pf6ECt-f5Gq6w_cKwh=DdsTdHnE+ENh--7vCw@mail.gmail.com>
Subject: Re: [meta-arm] Proposal to import ARM GCC toolchain recipes into meta-arm
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 24, 2020 at 12:18 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Fri, 24 Jan 2020 at 06:21, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > As one of the original developers of the whole "external-toolchain" support[1] and still being an active contributor[2], spanning through CodeSourcery->Linaro->Arm recipes, I would certainly welcome this move!
>
> Thanks Denys for your contribution.
>
> >
> > BTW, what is the branching strategy for this layer - will there be release branches, like thud, zeus, etc.?
>
> I would expect meta-arm tree to also support thud, warrior and zeus
> branches since external-arm-toolchain support all these OE release
> branches.

Our plan was only to support zeus and releases going forward.  This
was to limit the releases we need to test on.  If there is a desire
for more, then we can accommodate.

And to answer Denys' original question, yes we will create branches
for each one.  Given that we are currently only supporting zeus, this
is why we only have master now.  If there is a request for me (per
above), then we will branch as needed.

Thanks,
Jon


>
> -Sumit
>
> >
> > [1] https://git.openembedded.org/openembedded/log/recipes/meta/external-toolchain-csl.bb
> > [2] https://git.linaro.org/openembedded/meta-linaro.git/log/meta-linaro-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> >
> > --
> > Denys
> >
> >
> > On Thu, Jan 23, 2020 at 02:39 AM, Sumit Garg wrote:
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
> >
> > [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro-toolchain
> > [2] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> > [3] https://lists.yoctoproject.org/g/yocto/message/48094
> >
> > Regards,
> > Sumit
> >
> >
> 
