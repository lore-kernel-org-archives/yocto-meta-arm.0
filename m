Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web09.9019.1579843138103653128
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Jan 2020 21:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ConAJ9HM;
 spf=pass (domain: linaro.org, ip: 209.85.167.65, mailfrom: sumit.garg@linaro.org)
Received: by mail-lf1-f65.google.com with SMTP id z18so353186lfe.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 23 Jan 2020 21:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=knCT48VxpgNr8tLBunUejNr2e9lOGx2mpRHB8O7USf0=;
        b=ConAJ9HMCrftFhXms/Vkw+CGKG5crGJkwtWx4m9NberzJfcJ3TXVrlFWKiKzn6O3g7
         doUPRedkjoeCZT1RERt6tgFu2o4gPJD8bgsRyZhhZ8E7HcyiXuThh5JSfo+3GHyc5LIj
         CuKA2hvJVqstn4AIA3PFqagRGbahk3saT45zpbt+BFu4EsJ9Z27G+2dGY6fiMP/mZa1A
         qhg+yTv0wiU1dcGrCVvjzE8P9R4AdgyoKyA+5kT542o7QG++UncF9FRRGntXPa095lkp
         vZbDkZiOZEsgk+5y3wU6kqJsRuiwFsJ7xp1UTLqLg2Oj7YYi6Vr0kEpj/MgzaUPgmbSL
         fjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knCT48VxpgNr8tLBunUejNr2e9lOGx2mpRHB8O7USf0=;
        b=bFKTtodgJGjOzCIhr7XhYCE65Y2u/RlX1VlUwomFlpqdJ9XL4Zw22jA0r+sp7zLYGV
         OTvnU2E24VQ3rwJtTnWUEU29ajfcZnPO4ARBq5EQZJq2Nkd1ppI1AxM86MI9c0r3YRKC
         z/1qyPKXldoEV8h/slQO9diArlx0h0BEmBHJmcA64WUl0971HtuKxe4DvpMxQ+QkKxmv
         W+5mlBxFs9B+QkBGGpVGxnIxjUBRZEZeI8gpU7XvXe1Wt7nwIdXpgkEe/SUQVcbd5BQ4
         Ere4XAUy2Dyz59K+3BFASlVbJPGvvxfRNFTIhjBbA1eg1ZYTPftBeH7FXTuPffSvBE+G
         Vlhw==
X-Gm-Message-State: APjAAAWmXPP/eeuwRNC5FrVfwbi6ujqVYkuCn4s2qJdneGCtdDVC7ucu
	VzUrCeUHss1vMqizSyaviDrOiZmjbTyy6bn5XIheCg==
X-Google-Smtp-Source: APXvYqzFzR9aqnnnjxnk2xBAu6+DmiEy4j9m/XByxkKlNEZHiJK8zHpr5dNCD02Mmp5Enrq3YzVHnuY7GWYH8KO8AMU=
X-Received: by 2002:ac2:4909:: with SMTP id n9mr559313lfi.21.1579843136242;
 Thu, 23 Jan 2020 21:18:56 -0800 (PST)
MIME-Version: 1.0
References: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
 <12230.1579827059785197376@lists.yoctoproject.org>
In-Reply-To: <12230.1579827059785197376@lists.yoctoproject.org>
From: "Sumit Garg" <sumit.garg@linaro.org>
Date: Fri, 24 Jan 2020 10:48:44 +0530
Message-ID: <CAFA6WYMXaNgRgAJ_mC-TSYqgRBvZkVD4Le=qu-p4s-wZb9h25Q@mail.gmail.com>
Subject: Re: [meta-arm] Proposal to import ARM GCC toolchain recipes into meta-arm
To: denis@denix.org
Cc: meta-arm@lists.yoctoproject.org, jon.mason@arm.com, 
	Daniel Thompson <daniel.thompson@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jan 2020 at 06:21, Denys Dmytriyenko <denis@denix.org> wrote:
>
> As one of the original developers of the whole "external-toolchain" support[1] and still being an active contributor[2], spanning through CodeSourcery->Linaro->Arm recipes, I would certainly welcome this move!

Thanks Denys for your contribution.

>
> BTW, what is the branching strategy for this layer - will there be release branches, like thud, zeus, etc.?

I would expect meta-arm tree to also support thud, warrior and zeus
branches since external-arm-toolchain support all these OE release
branches.

-Sumit

>
> [1] https://git.openembedded.org/openembedded/log/recipes/meta/external-toolchain-csl.bb
> [2] https://git.linaro.org/openembedded/meta-linaro.git/log/meta-linaro-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
>
> --
> Denys
>
>
> On Thu, Jan 23, 2020 at 02:39 AM, Sumit Garg wrote:
>
> Hi Jon and all,
>
> As you may be aware that Linaro used to maintain meta-linaro-toolchain
> layer [1] in meta-linaro tree for GCC tool-set releases from Linaro
> till GCC 7.
>
> And since GCC 8, the tool-set release and maintenance work was
> transferred to ARM. But meta-linaro-toolchain layer continued support
> for ARM GCC tool-set releases as well.
>
> In future, I think meta-arm tree [2] shall be an appropriate place to
> host ARM GCC toolchain recipes as an additional meta-arm-toolchain
> layer. Also, with the latest integration [3] for ARM GCC 9.2 toolchain
> in meta-linaro, recipes are well tested and seems to be stable. So I
> would like to propose import of ARM GCC toolchain recipes into
> meta-arm.
>
> I am looking forward to any comments or suggestions regarding this proposal.
>
> [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro-toolchain
> [2] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> [3] https://lists.yoctoproject.org/g/yocto/message/48094
>
> Regards,
> Sumit
>
> 
