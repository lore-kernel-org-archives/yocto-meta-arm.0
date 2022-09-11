Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBD1ECAAD5
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 00:59:09 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.5765.1662857944992366340
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Sep 2022 17:59:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=T/6rDgRC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id g2so997734qkk.1
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Sep 2022 17:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Gm3+Y6k6z0eDdb3A2NDgCNpmUExXKOxSa3nX60v9J84=;
        b=T/6rDgRCEOYdQePuDQOOqEQT5b0HGA8vKXIsr6p6ChxJ0NVirHznRa6kF09NAjxBAW
         lpZpI2mgtE4jon3W7/jW6h0z3RlmaaCP2WMWrS5hTHSk53Lg3zJmuCHvAydwcaiykVAx
         XIFDihXf9EMuot+Ge3Kx/BAl+B66FRQuoBbO5XPV8qyQgHzoZ3srMedvB+gnUa4FnoeI
         xNvTSSDDWtCAyLeoV16u2jeljtgToMJ2KeV0s+LFhNRBMEUvgW4FQ5cZpRVCu6j42iVC
         87h+zePh206N3HwaIZTkJ7xhdUFgRQywrnVbObYAb74q6473ftgsS1R84Oq9fccjy8Eq
         fhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Gm3+Y6k6z0eDdb3A2NDgCNpmUExXKOxSa3nX60v9J84=;
        b=4sQtvHsK48x0YIyoUfLSQf6msNnCDOltsBuYGD2A/lWcbRCkMftQ0aUos8CDd+K3ve
         PMWijL6AJkRCuk+H5sg6s4y6N2uAMPol1CzS2MUcDVuoVVVqMeiMogd/WeT9Njp0NQUh
         QFa6Q1/7tculLcPUaMg3mIP5QabIyT1jrztH913f4M0uGiKSxQY1SxhKkLCnt3jvnWsm
         ggvSGMLl9laZdhZxvAmEmdvOPxWw/HRAoOiIfeTzE0C6O1O9qXBQ+0hl6dz0/TmDt4Z8
         3N8Bg80Njl+q8w+Bq8blw1FLwhP16Yzs8aLShbUNAqG2Uo723Dx7wV1WEX8mp55eCwPg
         8mnw==
X-Gm-Message-State: ACgBeo3caO+DqRtYP74cK9maBPOrw0r/Tv5wYkzrKOji7N0wihxBBtca
	SKhalEj7HwV/qZ+8/qr+XxSnykqnAleNNA==
X-Google-Smtp-Source: 
 AA6agR6uRL5qj1B9Z67OXyjlmcrLZzYQ+BaFRtrI7rR6m1PTwPf5XdTTn/x4FX9tZA8Lxqgzi+7aeg==
X-Received: by 2002:a37:27d3:0:b0:6cd:28fd:dda3 with SMTP id
 n202-20020a3727d3000000b006cd28fddda3mr6903491qkn.639.1662857943937;
        Sat, 10 Sep 2022 17:59:03 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bj18-20020a05620a191200b006cbd92ca141sm3843012qkb.133.2022.09.10.17.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 17:59:03 -0700 (PDT)
Date: Sat, 10 Sep 2022 20:59:01 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, diego.sueiro@arm.com
Subject: Re: [PATCH] arm/lib: Specify the FVP environment variables explicitly
Message-ID: <Yx0y1dKvCCK1nWiq@kudzu.us>
References: <20220909121206.3098601-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909121206.3098601-1-peter.hoyes@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 11 Sep 2022 00:59:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3763

This patch is causing selftest to fail on both master and kirkstone.
See https://gitlab.com/jonmason00/meta-arm/-/jobs/3007871323

Thanks,
Jon

On Fri, Sep 09, 2022 at 01:12:06PM +0100, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> It is sometimes useful to be able to configure the behavior of FVPs
> using environment variables, e.g. for licensing or plugins.
> 
> Add a new FVP option: FVP_ENV_PASSTHROUGH, which allows the Bitbake
> variables to be passed to the environment to be specified explicitly (in
> a similar way to BB_ENV_PASSTHROUGH). This ensures that:
> 
>  * FVPs launched via runfvp have a reproducable environment
>  * FVPs launched via testimage (which run from an isolated Bitbake task)
>    can receive environment variables
> 
> Issue-Id: SCM-4964
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Idf6ac6d41fda4cd5f950bc383c2fc1fa1acdf4e3
> ---
>  documentation/runfvp.md          | 8 ++++++++
>  meta-arm/classes/fvpboot.bbclass | 6 ++++++
>  meta-arm/lib/fvp/runner.py       | 5 ++++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/runfvp.md b/documentation/runfvp.md
> index c792f4e0..01b13693 100644
> --- a/documentation/runfvp.md
> +++ b/documentation/runfvp.md
> @@ -116,6 +116,14 @@ Arbitrary extra arguments that are passed directly to the FVP.  For example:
>  FVP_EXTRA_ARGS = "--simlimit 60"
>  ```
>  
> +### `FVP_ENV_PASSTHROUGH`
> +
> +The FVP is launched with an isolated set of environment variables. Add the name of a Bitbake variable to this list to pass it through to the FVP environment. For example:
> +
> +```
> +FVP_ENV_PASSTHROUGH = "ARMLMD_LICENSE_FILE FM_TRACE_PLUGINS"
> +```
> +
>  
>  [AEM]: https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms/arm-ecosystem-models
>  [FVP]: https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms
> diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.bbclass
> index fbdfa965..78dabd73 100644
> --- a/meta-arm/classes/fvpboot.bbclass
> +++ b/meta-arm/classes/fvpboot.bbclass
> @@ -23,6 +23,8 @@ FVP_CONSOLE ?= ""
>  FVP_CONSOLES[default] ?= "${FVP_CONSOLE}"
>  # Arbitrary extra arguments
>  FVP_EXTRA_ARGS ?= ""
> +# Bitbake variables to pass to the FVP environment
> +FVP_ENV_PASSTHROUGH ?= ""
>  
>  EXTRA_IMAGEDEPENDS += "${FVP_PROVIDER}"
>  
> @@ -66,6 +68,10 @@ python do_write_fvpboot_conf() {
>      data["terminals"] = getFlags("FVP_TERMINALS")
>      data["args"] = shlex.split(d.getVar("FVP_EXTRA_ARGS") or "")
>  
> +    data["env"] = {}
> +    for var in d.getVar("FVP_ENV_PASSTHROUGH").split():
> +        data["env"][var] = d.getVar(var)
> +
>      os.makedirs(os.path.dirname(conffile), exist_ok=True)
>      with open(conffile, "wt") as f:
>          json.dump(data, f)
> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> index 7641cd67..8c6b4cad 100644
> --- a/meta-arm/lib/fvp/runner.py
> +++ b/meta-arm/lib/fvp/runner.py
> @@ -60,7 +60,10 @@ class FVPRunner:
>          cli = cli_from_config(config, terminal_choice)
>          cli += extra_args
>          self._logger.debug(f"Constructed FVP call: {cli}")
> -        self._fvp_process = await asyncio.create_subprocess_exec(*cli, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
> +        self._fvp_process = await asyncio.create_subprocess_exec(
> +            *cli,
> +            stdin=subprocess.DEVNULL, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
> +            env=config['env'])
>  
>          def detect_terminals(line):
>              m = re.match(r"^(\S+): Listening for serial connection on port (\d+)$", line)
> -- 
> 2.25.1
> 
> 

