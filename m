Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01217ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 12:13:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.396.1662725596300840415
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 09 Sep 2022 05:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 388B415DB;
	Fri,  9 Sep 2022 05:13:22 -0700 (PDT)
Received: from [10.57.88.42] (unknown [10.57.88.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4541B3F7B4;
	Fri,  9 Sep 2022 05:13:14 -0700 (PDT)
Message-ID: <b23cb6b1-4806-0536-5696-2782c6d72a7f@arm.com>
Date: Fri, 9 Sep 2022 13:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-arm] [PATCH] arm/lib: Specify the FVP environment variables
 explicitly
Content-Language: en-US
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com
References: <17133003169028D3.21784@lists.yoctoproject.org>
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <17133003169028D3.21784@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 09 Sep 2022 12:13:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3756

On 09/09/2022 13:12, Peter Hoyes via lists.yoctoproject.org wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> It is sometimes useful to be able to configure the behavior of FVPs
> using environment variables, e.g. for licensing or plugins.
>
> Add a new FVP option: FVP_ENV_PASSTHROUGH, which allows the Bitbake
> variables to be passed to the environment to be specified explicitly (in
> a similar way to BB_ENV_PASSTHROUGH). This ensures that:
>
>   * FVPs launched via runfvp have a reproducable environment
>   * FVPs launched via testimage (which run from an isolated Bitbake task)
>     can receive environment variables
>
> Issue-Id: SCM-4964
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: Idf6ac6d41fda4cd5f950bc383c2fc1fa1acdf4e3

Please can this patch also be backported to kirkstone

> ---
>   documentation/runfvp.md          | 8 ++++++++
>   meta-arm/classes/fvpboot.bbclass | 6 ++++++
>   meta-arm/lib/fvp/runner.py       | 5 ++++-
>   3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/runfvp.md b/documentation/runfvp.md
> index c792f4e0..01b13693 100644
> --- a/documentation/runfvp.md
> +++ b/documentation/runfvp.md
> @@ -116,6 +116,14 @@ Arbitrary extra arguments that are passed directly to the FVP.  For example:
>   FVP_EXTRA_ARGS = "--simlimit 60"
>   ```
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
>   [AEM]: https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms/arm-ecosystem-models
>   [FVP]: https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms
> diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.bbclass
> index fbdfa965..78dabd73 100644
> --- a/meta-arm/classes/fvpboot.bbclass
> +++ b/meta-arm/classes/fvpboot.bbclass
> @@ -23,6 +23,8 @@ FVP_CONSOLE ?= ""
>   FVP_CONSOLES[default] ?= "${FVP_CONSOLE}"
>   # Arbitrary extra arguments
>   FVP_EXTRA_ARGS ?= ""
> +# Bitbake variables to pass to the FVP environment
> +FVP_ENV_PASSTHROUGH ?= ""
>   
>   EXTRA_IMAGEDEPENDS += "${FVP_PROVIDER}"
>   
> @@ -66,6 +68,10 @@ python do_write_fvpboot_conf() {
>       data["terminals"] = getFlags("FVP_TERMINALS")
>       data["args"] = shlex.split(d.getVar("FVP_EXTRA_ARGS") or "")
>   
> +    data["env"] = {}
> +    for var in d.getVar("FVP_ENV_PASSTHROUGH").split():
> +        data["env"][var] = d.getVar(var)
> +
>       os.makedirs(os.path.dirname(conffile), exist_ok=True)
>       with open(conffile, "wt") as f:
>           json.dump(data, f)
> diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
> index 7641cd67..8c6b4cad 100644
> --- a/meta-arm/lib/fvp/runner.py
> +++ b/meta-arm/lib/fvp/runner.py
> @@ -60,7 +60,10 @@ class FVPRunner:
>           cli = cli_from_config(config, terminal_choice)
>           cli += extra_args
>           self._logger.debug(f"Constructed FVP call: {cli}")
> -        self._fvp_process = await asyncio.create_subprocess_exec(*cli, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
> +        self._fvp_process = await asyncio.create_subprocess_exec(
> +            *cli,
> +            stdin=subprocess.DEVNULL, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
> +            env=config['env'])
>   
>           def detect_terminals(line):
>               m = re.match(r"^(\S+): Listening for serial connection on port (\d+)$", line)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3755): https://lists.yoctoproject.org/g/meta-arm/message/3755
> Mute This Topic: https://lists.yoctoproject.org/mt/93571100/5715260
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [peter.hoyes@arm.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

