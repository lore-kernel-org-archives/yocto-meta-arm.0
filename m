Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web12.754.1579899911397008675
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jan 2020 13:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mMlLY1Kw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.44, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f44.google.com with SMTP id z8so3395459ioh.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jan 2020 13:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+j3zgztSnQM2vf7IF0+hqpwX3imm3q+7MP4LxrR3VPY=;
        b=mMlLY1KwdSCiyclcbtkP0iajdRE/RFD8es0q19sMILMXr9jpq6UXYw1BRq8degh1WT
         cbiIcLnRPjICycgh2uaPJvj8zFXL4CghcAyxi5wkO/3g82jWoSIgciFkkt8xLyCa31cV
         CPaVP3xPZIYxJb3BZEfFyZP3SJtW/HF1q3zUGHSSI5OlIffjaGa6YN6M5TWFtelc1TaD
         WfqtyeeFUg9dMXoyvTEK6BP7PqFArkuQzqxgMWrBT8eQDdKMRf/ujjNpkd5vKIEznlop
         8DsYvVkRCSvpW3gJf/9XzKtZn/uPec8dka2R3Ejx4Vcb8uteT4Q3mUqK2xLIpT4RKbSp
         Ur3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+j3zgztSnQM2vf7IF0+hqpwX3imm3q+7MP4LxrR3VPY=;
        b=nk+KPsWMnOql5YyY2/YvKwpQ7+1zctkhsgf9CnoeaJQdOEt4d3H/KWJtz/t1pwMiJi
         sM9Y96eb/uGjRqiH3TKeh7SVTlAigdXBTBeBPPrIUA/iEjJd/+TKjDpCpnFH1blu/xma
         H3ZWl6p+VH5asqUxPZkVPw0xZCxOpb7dFgKaDq5rIhRqTFEAIktMI+TY/FaIo2GrL7S2
         hOn0LjAhfnIzDwP0zYz7S2Jx0gDLnpXCwt5gsuJwH4vp1IPJN/LMAN0rh8WCgtAxoloq
         sYfdbIUAW5GN/NHMIARBqOr+ecZi024vuiXJCmGW7no64I4iAOtTRmjKMTPAmTRTIPBF
         oDBg==
X-Gm-Message-State: APjAAAUeXs6bOqI7KaKlFtEj/SfnvDQ+7d+0nJl1OVmsG/CJ0jbwAY04
	DPuZSiFcwD1dBhW0bJbMhUv9u/pjeUsKdaJKoUBRjLCsjus=
X-Google-Smtp-Source: APXvYqxKv5zkn3LvEeAHDZJnpyS0qP7QZC+M05aHJQjrncg4kRpZipq+8OxP50S2yrfMU4JsqkMLevnseVPiAroYSvI=
X-Received: by 2002:a05:6638:538:: with SMTP id j24mr3880022jar.12.1579899910597;
 Fri, 24 Jan 2020 13:05:10 -0800 (PST)
MIME-Version: 1.0
References: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
In-Reply-To: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Fri, 24 Jan 2020 16:04:59 -0500
Message-ID: <CAPoiz9w4u_s526ek1MONnpx934w2+K3zH4vU==0h-qR+SSq9YQ@mail.gmail.com>
Subject: Re: [meta-arm] Proposal to import ARM GCC toolchain recipes into meta-arm
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com, Daniel Thompson <daniel.thompson@linaro.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 5:39 AM Sumit Garg <sumit.garg@linaro.org> wrote:
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

I am very much in favor of this and was working on a recipe to do this
before the end of last year (but was not working and was not able to
get back to it yet).  If you send emails to this mailing list with the
relevant code, I'll happily pull them in.  Since this is already in
the meta-linaro tree, I think the optics of you submitting it to
meta-arm are better.  However, if you are busy with other things, I
can pull all of the relevant recipes in from meta-linaro.  Just tell
me which you prefer.

Thanks,
Jon

> [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro-toolchain
> [2] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> [3] https://lists.yoctoproject.org/g/yocto/message/48094
>
> Regards,
> Sumit
> 
